#include <stdlib.h>
#include "myLib.h"
#include "game.h"

// Variables
PLAYER player;
BALL balls[BALLCOUNT];
GOAL goals[GOALCOUNT];
int goalsRemaining;

// Initialize the game
void initGame() {
	initPlayer();
	initBalls();
	initGoals();
	goalsRemaining = GOALCOUNT;
}

// Updates the game each frame
void updateGame() {

	updatePlayer();

	for (int i = 0; i < BALLCOUNT; i++) {
		updateBall(&balls[i]);
		updateGoal(&goals[i]);
	}

}

// Draws the game each frame
void drawGame() {

	drawPlayer();

	for (int i = 0; i < BALLCOUNT; i++) {
		if (balls[i].active) {
			drawBall(&balls[i]);
		}
	}

	for (int i = 0; i < GOALCOUNT; i++) {
		if (goals[i].active) {
			drawGoal(&goals[i]);
		}
	}

}


// Initialize the player
void initPlayer() {

	player.row = 140;
	player.col = 118;
	player.oldRow = player.row;
	player.oldCol = player.col;
	player.cdel = 2;
	player.height = 5;
	player.width = 5;
	player.color = GRAY;

}

// Handle every-frame actions of the player
void updatePlayer() {

	// Move the player
	if (BUTTON_HELD(BUTTON_LEFT) && player.col >= 0) {
		player.col -= player.cdel;
	} else if (BUTTON_HELD(BUTTON_RIGHT) && player.col + player.width <= SCREENWIDTH - 1) {
		player.col += player.cdel;
	} else if (BUTTON_HELD(BUTTON_DOWN) && player.row + player.height <= SCREENHEIGHT - 1) {
		player.row += player.cdel;
	} else if (BUTTON_HELD(BUTTON_UP) && player.row >= 0) {
		player.row -= player.cdel;
	}
}



// Draw the player
void drawPlayer() {

	drawRect(player.oldRow, player.oldCol, player.height, player.width, DARKBLUE);
	drawRect(player.row, player.col, player.height, player.width, player.color);

	player.oldRow = player.row;
	player.oldCol = player.col;
}

// Initialize the balls
void initBalls() {

	for (int i = 0; i < BALLCOUNT; i++) {
		balls[i].height = 10;
		balls[i].width = 10;
		balls[i].row = rand() % 110;
		balls[i].col = rand() % 130 + 10;
		balls[i].oldRow = balls[i].row;
		balls[i].oldCol = balls[i].col;
		balls[i].rdel = 1;
		balls[i].cdel = 1;
		balls[i].color = RED;
		balls[i].active = 1;
		balls[i].erased = 0;
	}
}

// Initialize the Goals
void initGoals() {

	for (int i = 0; i < GOALCOUNT; i++) {
		goals[i].height = 10;
		goals[i].width = 10;
		goals[i].row = rand() % 110;
		goals[i].col = rand() % 130 + 10;
		goals[i].oldRow = goals[i].row;
		goals[i].oldCol = goals[i].col;
		goals[i].rdel = 1;
		goals[i].cdel = 1;
		goals[i].color = GREEN;
		goals[i].active = 1;
		goals[i].erased = 0;
	}
}

// Handle every-frame actions of a ball
void updateBall(BALL* b) {

	if (b->active) {

		// Bounce the ball off the sides of the box
		if (b->row <= 0 || b->row + b->height-1 >= 160)
			b->rdel *= -1;
		if (b->col <= 0 || b->col + b->width-1 >= SCREENWIDTH-1)
			b->cdel *= -1;

		// Move the ball
		b->row += b->rdel;
		b->col += b->cdel;

		if (collision(player.row, player.col, player.height, player.width, b->row, b->col, b->height, b->width)) {
			deactivateAllMovingObjects();
			drawBall(b);
			goToLose();
		}
	}
}

// Handle every-frame actions of a goals
void updateGoal(GOAL* b) {

	if (b->active) {

		// Bounce the goal off the sides of the box
		if (b->row <= 0 || b->row + b->height-1 >= 160)
			b->rdel *= -1;
		if (b->col <= 0 || b->col + b->width-1 >= SCREENWIDTH-1)
			b->cdel *= -1;

		// Move the goal
		b->row += b->rdel;
		b->col += b->cdel;

		// if the player hits the goal, the goal disappears and the goals remaining decreases by 1
		if (collision(player.row, player.col, player.height, player.width, b->row, b->col, b->height, b->width)) {
			b->active = 0;
			b->col = 300;
			b->erased = 0;
			drawGoal(b);
			goalsRemaining--;
		}
	}
}

void deactivateAllMovingObjects() {
	for (int i = 0; i < BALLCOUNT; i++) {
		balls[i].active = 0;
		balls[i].erased = 0;
		balls[i].color = DARKBLUE;
		drawBall(&balls[i]);
	}

	for (int i = 0; i < GOALCOUNT; i++) {
		goals[i].active = 0;
		goals[i].erased = 0;
		goals[i].color = DARKBLUE;
		drawGoal(&goals[i]);
	}
}


// Draw a ball
void drawBall(BALL* b) {

	if(b->active) {
		drawRect(b->oldRow, b->oldCol, b->height, b->width, DARKBLUE);
		drawRect(b->row, b->col, b->height, b->width, b->color);
	} else if (!b->erased) {
		drawRect(b->oldRow, b->oldCol, b->height, b->width, DARKBLUE);
		b->erased = 1;
	}
	b->oldRow = b->row;
	b->oldCol = b->col;
}

// Draw a goal
void drawGoal(GOAL* b) {

	if(b->active) {
		drawRect(b->oldRow, b->oldCol, b->height, b->width, DARKBLUE);
		drawRect(b->row, b->col, b->height, b->width, b->color);
	} else if (!b->erased) {
		drawRect(b->oldRow, b->oldCol, b->height, b->width, DARKBLUE);
		b->erased = 1;
	}
	b->oldRow = b->row;
	b->oldCol = b->col;
}