// Animated Sprite Struct
typedef struct {
	int row;
	int col;
    int rdel;
    int cdel;
	int width;
    int height;
    int aniCounter;
    int aniState;
    int curFrame;
    int numFrames;
    int index;
    int active;
} ANISPRITE;

// Constants
#define BULLETCOUNT 10
#define ENEMYBULLETCOUNT 10
#define ENEMYCOUNT 30
#define PLAYERLIVES 3

// Variables
extern ANISPRITE player;
extern ANISPRITE lives;
extern ANISPRITE bullets[BULLETCOUNT];
extern ANISPRITE enemyBullets[ENEMYBULLETCOUNT];
extern ANISPRITE enemies[ENEMYCOUNT];
extern int playerLives;
extern int enemiesRemaining;
extern int enemiesPassed;

// Shadow OAM
extern OBJ_ATTR shadowOAM[128];

// Game Prototypes
void initGame();
void updateGame();
void drawGame();

// Player Prototypes
void initPlayer();
void updatePlayer();
void drawPlayer();

// Lives Prototypes
void initLives();
void updateLives();
void drawLives();

// Bullet Prototypes
void initBullets();
void fireBullet();
void fireEnemyBullet(ANISPRITE *);
void updateBullet(ANISPRITE *);
void updateEnemyBullet(ANISPRITE *);
void drawBullet(ANISPRITE *);
void drawEnemyBullet(ANISPRITE *);

// Enemy Prototypes
void initEnemies();
void updateEnemy(ANISPRITE *);
void drawEnemy(ANISPRITE *);