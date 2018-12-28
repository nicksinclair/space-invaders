#include <stdlib.h>
#include "myLib.h"
#include "game.h"

#include "spritesheet.h"

// Variables
ANISPRITE player;
ANISPRITE lives;
ANISPRITE bullets[BULLETCOUNT];
ANISPRITE enemyBullets[ENEMYBULLETCOUNT];
ANISPRITE enemies[ENEMYCOUNT];

int playerLives;
int enemiesRemaining;
int enemiesPassed;

// Shadow OAM
OBJ_ATTR shadowOAM[128];

// Initialize the game
void initGame() {
	initPlayer();
	initLives();
    initBullets();
    initEnemies();

    // Loads spritesheet's palette and tiles into respective PALETTE and CHARBLOCK
    DMANow(3, spritesheetPal, SPRITEPALETTE, spritesheetPalLen/2);
	DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen/2);

    // Initialize amount of player lives
    playerLives = 3;

    // Initialize the amount of enemies remaining
	enemiesRemaining = ENEMYCOUNT;
	enemiesPassed = 0;
}

// Updates the game each frame
void updateGame() {
	// Update the player
	updatePlayer();

	// Update the player lives
	updateLives();

	// Update all the player's bullets
	for(int i = 0; i < BULLETCOUNT; i++) {
		updateBullet(&bullets[i]);
	}

	// Update all the enemy bullets
	for(int i = 0; i < ENEMYBULLETCOUNT; i++) {
		updateEnemyBullet(&enemyBullets[i]);
	}

	// Update all the enemies
	for (int i = 0; i < ENEMYCOUNT; i++) {
		updateEnemy(&enemies[i]);
	}
}

void drawGame() {
	// Draw the player
	drawPlayer();

	// Draw the player lives
	drawLives();

	// Draw the player bullets
	for(int i = 0; i < BULLETCOUNT; i++) {
		drawBullet(&bullets[i]);
	}

	// Draw the enemy bullets
	for(int i = 0; i < ENEMYBULLETCOUNT; i++) {
		drawEnemyBullet(&enemyBullets[i]);
	}

	// Draw the enemies
	for(int i = 0; i < ENEMYCOUNT; i++) {
		drawEnemy(&enemies[i]);
	}

}

// Initialize the player
void initPlayer() {
	player.row = 146;
	player.col = 112;
	player.rdel = 0;
	player.cdel = 2;
	player.width = 16;
	player.height = 16;

	// Player Sprite Animation Properties
	player.aniState = 0;
	player.curFrame = 0;
}

// Handle every-frame actions of the player
void updatePlayer() {
	// Move the player horizontally
	if (BUTTON_HELD(BUTTON_LEFT) && player.col >= player.cdel) {
		player.col -= player.cdel;
	} else if (BUTTON_HELD(BUTTON_RIGHT) && player.col + player.width - 1 < SCREENWIDTH - player.cdel) {
		player.col += player.cdel;
	}

	// Fire bullets
	if (BUTTON_PRESSED(BUTTON_A)) {
		fireBullet();
	}

	// Handle player-bullet collisions
	for (int i = 0; i < ENEMYBULLETCOUNT; i++) {
		if (enemyBullets[i].active && collision(player.row, player.col, player.height, player.width, enemyBullets[i].row, enemyBullets[i].col, enemyBullets[i].height, enemyBullets[i].width)) {
			enemyBullets[i].active = 0;
			playerLives--;
		}
	}
}

// Draw the player
void drawPlayer() {
	shadowOAM[0].attr0 = player.row | ATTR0_WIDE;
	shadowOAM[0].attr1 = player.col;
	shadowOAM[0].attr2 = ATTR2_TILEID((player.curFrame), (player.aniState) * 2);
}

// Initialize the player lives
void initLives() {
	lives.row = 0;
	lives.col = 36;
	lives.width = 8;
	lives.height = 8;

	// Lives Sprite Animation Properties
	lives.aniCounter = 0;
	lives.aniState = 9;
	lives.curFrame = 0;
}

// Handle every-frame actions of the lives
void updateLives() {
	if (playerLives == 2) {
		lives.aniState = 10;
	}
	if (playerLives == 1) {
		lives.aniState = 11;
	}
}

// Draw the lives
void drawLives() {
	shadowOAM[60].attr0 = lives.row;
	shadowOAM[60].attr1 = lives.col;
	shadowOAM[60].attr2 = ATTR2_TILEID((lives.curFrame), (lives.aniState));
}

// Initialize the bullets for both the player and the enemies
void initBullets() {
	for(int i = 0; i < BULLETCOUNT; i++) {
		bullets[i].height = 4;
		bullets[i].width = 2;
		bullets[i].row = -bullets[i].height;
		bullets[i].col = 0;
		bullets[i].rdel = 2;
		bullets[i].active = 0;
		bullets[i].index = i + 32;

		// Player Bullet Sprite Animation Properties
		bullets[i].aniCounter = 0;
		bullets[i].aniState = 8;
		bullets[i].curFrame = 0;
	}

	for(int j = 0; j < ENEMYBULLETCOUNT; j++) {
		enemyBullets[j].height = 4;
		enemyBullets[j].width = 2;
		enemyBullets[j].row = -enemyBullets[j].height;
		enemyBullets[j].col = 0;
		enemyBullets[j].rdel = 1;
		enemyBullets[j].active = 0;
		enemyBullets[j].index = j + 42;

		// Enemy Bullet Sprite Animation Properties
		enemyBullets[j].aniCounter = 0;
		enemyBullets[j].aniState = 12;
		enemyBullets[j].curFrame = 0;
	}
}

// Spawn a bullet from the player
void fireBullet() {
	// Find the first inactive bullet, initialize it, and set it active
	for(int i = 0; i < BULLETCOUNT; i++) {
		if (!bullets[i].active) {
			bullets[i].row = player.row - 5;
			bullets[i].col = player.col + (player.width / 2) + (bullets[i].width / 2);
			bullets[i].active = 1;
			break;
		}
	}
}

// Spawn a bullet from an enemy
void fireEnemyBullet(ANISPRITE *b) {
	// Find the first inactive bullet, initialize it, and set it active
	for(int i = 0; i < ENEMYBULLETCOUNT; i++) {
		if (!enemyBullets[i].active) {
			enemyBullets[i].row = b->row;
			enemyBullets[i].col = b->col + (b->width / 2) + (enemyBullets[i].width / 2);
			enemyBullets[i].active = 1;
			break;
		}
	}
}

// Handle every-frame actions of a player bullet
void updateBullet(ANISPRITE *b) {
	if (b->active) {
		b->row--;
		if (b->row <= 0) {
			b->active = 0;
		}
	}
}

// Handle every-frame actions of an enemy bullet
void updateEnemyBullet(ANISPRITE *b) {
	if (b->active) {
		b->row++;
		if (b->row > 159) {
			b->active = 0;
		}
	} 
}

// Draw a player bullet
void drawBullet(ANISPRITE *b) {
	if (b->active) {
		// Update the player bullet position on screen in shadowOAM
		shadowOAM[b->index].attr0 = b->row & ROWMASK;
		shadowOAM[b->index].attr1 = b->col & COLMASK;
		shadowOAM[b->index].attr2 = ATTR2_TILEID((b->curFrame), (b->aniState));
	} else {
		// Hide the player bullet if inactive
		shadowOAM[b->index].attr0 = ATTR0_HIDE;
	}
}

// Draw an enemy bullet
void drawEnemyBullet(ANISPRITE *b) {
	if (b->active) {
		// Update the enemy bullet position on screen in shadowOAM
		shadowOAM[b->index].attr0 = b->row & ROWMASK;
		shadowOAM[b->index].attr1 = b->col & COLMASK;
		shadowOAM[b->index].attr2 = ATTR2_TILEID((b->curFrame), (b->aniState));
	} else {
		// Hide the enemy bullet if inactive
		shadowOAM[b->index].attr0 = ATTR0_HIDE;
	}
}

// Initialize the pool of enemies
void initEnemies() {
	// Arrange enemies into a grid upon initialization
	int rowCount = 1;
	int colCount = 1;
	int stateCounter = 1;
	for(int i = 0; i < ENEMYCOUNT; i++) {
		enemies[i].height = 16;
		enemies[i].width = 16;
		enemies[i].row = 20 * rowCount;
		enemies[i].col = 20 * colCount;
		enemies[i].rdel = 2;
        enemies[i].cdel = 1;
		enemies[i].active = 1;
		enemies[i].index = i + 1;
		colCount++;

		if ((i + 1) % 6 == 0) {
			rowCount++;
			colCount = 1;
		}

		// Enemy Sprite Animation Properties
		enemies[i].aniCounter = 0;
		enemies[i].aniState = stateCounter;
		if (enemies[i].index % 12 == 0) {
			stateCounter++;
		}
		enemies[i].curFrame = 0;
		enemies[i].numFrames = 2;
	}
}

// Handle every frame actions of an enemy
void updateEnemy(ANISPRITE *b) {
	if (b->active) {
		// Move enemies horizontally
		b->col += b->cdel;

		// Handle enemy-bullet collisions
		for (int i = 0; i < BULLETCOUNT; i++) {
			if (bullets[i].active && collision(b->row, b->col, b->height, b->width, bullets[i].row, bullets[i].col, bullets[i].height, bullets[i].width)) {
				b->active = 0;
				bullets[i].active = 0;
				enemiesRemaining--;
				//shadowOAM[b->index].attr0 = ATTR0_HIDE;
			}
		}
		
		// If enemy touches wall, change its direction and shift downward
		if(b->col <= 0 || b->col + b->width - 1 >= SCREENWIDTH - 1) {
			for (int i = 0; i < ENEMYCOUNT; i++) {
				enemies[i].cdel *= -1;
				enemies[i].row += b->height/2;
			}
		}

		// If enemy passes player, automatically lose
		if(b->row + b->height >= player.row) {
			enemiesPassed = 1;
		}

		// Fire bullets (randomly)
		if (rand() < (RAND_MAX >> 10)) {
			fireEnemyBullet(b);
		}

		// Cycle through enemy animations
		if(b->aniCounter % 20 == 0) {
			if(b->curFrame == 1) {
				b->curFrame = 0;
			} else {
				b->curFrame++;
			}
		}
		b->aniCounter++;
	} 
}

// Draw an enemy
void drawEnemy(ANISPRITE *b) {
	if (b->active) {
		// Update enemy sprite positions on screen
		shadowOAM[b->index].attr0 = b->row | ATTR0_WIDE;
		shadowOAM[b->index].attr1 = b->col;
		shadowOAM[b->index].attr2 = ATTR2_TILEID((b->curFrame), (b->aniState) * 2);
	} else {
		// Hide the enemy if inactive
		shadowOAM[b->index].attr0 = ATTR0_HIDE;
	}
}