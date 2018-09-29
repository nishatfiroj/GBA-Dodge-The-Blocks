#include <stdlib.h>
#include "myLib.h"
#include "game.h"

// Prototypes
void initialize();
void startState();
void winState();
void pauseState();
void loseState();
void gameState();

// State Prototypes
void startState();
void goToStart();
void gameState();
void goToGame();
void pauseState();
void goToPause();
void winState();
void goToWin();
void loseState();
void goToLose();

// States
enum {START, GAME, PAUSE, WIN, LOSE};
int state;

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Random Seed
int seed;

int main() {

    initialize();

    while(1) {

        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;
                
        // State Machine
        switch(state) {
            case START:
                startState();
                break;
            case GAME:
                gameState();
                break;
            case PAUSE:
                pauseState();
                break;
            case WIN:
                winState();
                break;
            case LOSE:
                loseState();
                break;
        }
               
    }
}

// the following functions up GBA states //

void initialize() {
    REG_DISPCTL = MODE3 | BG2_ENABLE;
    goToStart();
}

void startState(){
    seed++;
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
        srand(seed);
        initGame();
    }
}

void goToStart() {
    fillScreen(WHITE);
    drawString(80, 100, "START", BLACK);
    state = START;
}

void gameState() {
    updateGame();
    waitForVBlank();
    drawGame();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
    if (BUTTON_PRESSED(BUTTON_B)) {
        goToLose();
    }
    if (goalsRemaining == 0) {
        goToWin();
    }
}

void goToGame() {
    fillScreen(DARKBLUE);
    state = GAME;
}

void pauseState() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}

void goToPause() {
    fillScreen(BABY);
    drawString(80, 100, "PAUSE", WHITE);
    state = PAUSE;
}

void winState() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

void goToWin() {
    fillScreen(TEAL);
    drawString(80, 100, "YOU WIN!", BABY);
    state = WIN;
}

void loseState() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

void goToLose() {
    fillScreen(PINK);
    drawString(80, 100, "YOU LOSE!", WHITE);
    state = LOSE;
}
