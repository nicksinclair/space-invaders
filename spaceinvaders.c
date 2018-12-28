#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "game.h"

#include "startBG.h"
#include "gameBG.h"
#include "pauseBG.h"
#include "winBG.h"
#include "loseBG.h"

// Prototpyes
void initialize();

// State Prototypes
void goToStart();
void start();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();

// States
enum {START, GAME, PAUSE, WIN, LOSE};
int state;

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

// Background Offsets
int hOff = 0;
int vOff = 0;

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
                start();
                break;
            case GAME:
                game();
                break;
            case PAUSE:
                pause();
                break;
            case WIN:
                win();
                break;
            case LOSE:
                lose();
                break;
        }       
	}
}

// Initializes the game on launch
void initialize() {
	// Sets up control display register
	REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;

	// Sets up background 0 control register
	REG_BG0CNT = BG_4BPP | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);

	// Set offsets
	hOff = 8;
	vOff = 48;

	// Set up the first state
	goToStart();
}

// Sets up the start state
void goToStart() {
	// Load gameBG palette, map, and tiles
	DMANow(3, startBGPal, PALETTE, startBGPalLen/2);
	DMANow(3, startBGMap, &SCREENBLOCK[31], startBGMapLen/2);
	DMANow(3, startBGTiles, &CHARBLOCK[0], startBGTilesLen/2);
   
    waitForVBlank();

    state = START;

    // Begin the seed randomization
    seed = 0;
}

// Runs every frame of the start state
void start() {
    seed++;

    // Keep framerate at 60 fps
    waitForVBlank();

    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) {
        // Seed the random generator
        srand(seed);

        goToGame();
        initGame();
    }
}

// Sets up the game state
void goToGame() {
	// Load gameBG palette, map, and tiles
	DMANow(3, gameBGPal, PALETTE, gameBGPalLen/2);
	DMANow(3, gameBGMap, &SCREENBLOCK[31], gameBGMapLen/2);
	DMANow(3, gameBGTiles, &CHARBLOCK[0], gameBGTilesLen/2);

	hideSprites();

    DMANow(3, shadowOAM, OAM, 128 * 4);

    state = GAME;
}

void game() {
	updateGame();
	drawGame();

	waitForVBlank();

	REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

	DMANow(3, shadowOAM, OAM, 128 * 4);

	// State transitions
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
    else if (enemiesRemaining == 0) {
        goToWin();
    }
    else if (BUTTON_PRESSED(BUTTON_B) || playerLives == 0 || enemiesPassed) {
        goToLose();
    }  
}

// Sets up the pause state
void goToPause() {
	// Load gameBG palette, map, and tiles
	DMANow(3, pauseBGPal, PALETTE, pauseBGPalLen/2);
	DMANow(3, pauseBGMap, &SCREENBLOCK[31], pauseBGMapLen/2);
	DMANow(3, pauseBGTiles, &CHARBLOCK[0], pauseBGTilesLen/2);

    waitForVBlank();

    hideSprites();

    DMANow(3, shadowOAM, OAM, 128 * 4);

    state = PAUSE;
}

// Runs every frame of the pause state
void pause() {
    // Keep framerate at 60 fps
    waitForVBlank();

    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    }
    else if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}

// Sets up the win state
void goToWin() {
	// Load gameBG palette, map, and tiles
	DMANow(3, winBGPal, PALETTE, winBGPalLen/2);
	DMANow(3, winBGMap, &SCREENBLOCK[31], winBGMapLen/2);
	DMANow(3, winBGTiles, &CHARBLOCK[0], winBGTilesLen/2);

    waitForVBlank();

    hideSprites();

    DMANow(3, shadowOAM, OAM, 128 * 4);

    state = WIN;
}

// Runs every frame of the win state
void win() {
    // Keep framerate at 60 fps
    waitForVBlank();

    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}

// Sets up the lose state
void goToLose() {
	// Load gameBG palette, map, and tiles
	DMANow(3, loseBGPal, PALETTE, loseBGPalLen/2);
	DMANow(3, loseBGMap, &SCREENBLOCK[31], loseBGMapLen/2);
	DMANow(3, loseBGTiles, &CHARBLOCK[0], loseBGTilesLen/2);

    waitForVBlank();

    hideSprites();

    DMANow(3, shadowOAM, OAM, 128 * 4);

    state = LOSE;
}

// Runs every frame of the lose state
void lose() {
    // Keep framerate at 60 fps
    waitForVBlank();

    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStart();
    }
}
