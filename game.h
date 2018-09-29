// Player Struct
typedef struct {
	int row;
	int col;
	int oldRow;
	int oldCol;
	int cdel;
	int height;
	int width;
	unsigned short color;
} PLAYER;

// Ball Struct
typedef struct {
	int row;
	int col;
	int oldRow;
	int oldCol;
	int rdel;
	int cdel;
	int height;
	int width;
	unsigned short color;
	int active;
	int erased;
} BALL;

// Ball Struct
typedef struct {
	int row;
	int col;
	int oldRow;
	int oldCol;
	int rdel;
	int cdel;
	int height;
	int width;
	unsigned short color;
	int active;
	int erased;
} GOAL;

// Constants
#define BALLCOUNT 5
#define GOALCOUNT 5

// Variables
extern PLAYER player;
extern BALL balls[BALLCOUNT];
extern GOAL goals[GOALCOUNT];
extern int goalsRemaining;

// Prototypes
void initGame();
void updateGame();
void drawGame();
void initPlayer();
void updatePlayer();
void drawPlayer();
void initBalls();
void updateBall(BALL *);
void drawBall(BALL *);
void initGoals();
void updateGoal(GOAL *);
void drawGoal(GOAL *);
void drawString(int row, int col, char *str, unsigned short color);
void goToLose();
void goToWin();
void deactivateAllMovingObjects();