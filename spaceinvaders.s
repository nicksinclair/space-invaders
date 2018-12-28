	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"spaceinvaders.c"
	.text
	.align	2
	.global	goToStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L4
	mov	r2, #83886080
	ldr	r1, .L4+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L4+8
	ldr	r1, .L4+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	ldr	r1, .L4+16
	ldr	r3, .L4+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+24
	mov	lr, pc
	bx	r3
	mov	r3, #0
	ldr	r1, .L4+28
	ldr	r2, .L4+32
	str	r3, [r1]
	str	r3, [r2]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	startBGPal
	.word	100726784
	.word	startBGMap
	.word	startBGTiles
	.word	16400
	.word	waitForVBlank
	.word	state
	.word	seed
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r2, #67108864
	mov	lr, #4352
	mov	ip, #7936
	mov	r1, #8
	mov	r0, #48
	ldr	r3, .L8
	strh	lr, [r2]	@ movhi
	strh	ip, [r2, #8]	@ movhi
	ldr	lr, [sp], #4
	str	r0, [r3, #4]
	str	r1, [r3]
	b	goToStart
.L9:
	.align	2
.L8:
	.word	.LANCHOR0
	.size	initialize, .-initialize
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L12
	mov	r2, #83886080
	ldr	r1, .L12+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L12+8
	ldr	r1, .L12+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	ldr	r1, .L12+16
	mov	r0, #3
	mov	r3, #64
	mov	lr, pc
	bx	r4
	ldr	r3, .L12+20
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L12+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L12+28
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L13:
	.align	2
.L12:
	.word	DMANow
	.word	gameBGPal
	.word	100726784
	.word	gameBGMap
	.word	gameBGTiles
	.word	hideSprites
	.word	shadowOAM
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L21
	ldr	r3, [r4]
	ldr	r2, .L21+4
	add	r3, r3, #1
	str	r3, [r4]
	mov	lr, pc
	bx	r2
	mov	r3, #67108864
	ldr	r2, .L21+8
	ldrh	r0, [r2]
	ldrh	r1, [r2, #4]
	strh	r0, [r3, #16]	@ movhi
	ldr	r2, .L21+12
	strh	r1, [r3, #18]	@ movhi
	ldrh	r3, [r2]
	tst	r3, #8
	beq	.L14
	ldr	r3, .L21+16
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L20
.L14:
	pop	{r4, lr}
	bx	lr
.L20:
	ldr	r0, [r4]
	ldr	r3, .L21+20
	mov	lr, pc
	bx	r3
	bl	goToGame
	ldr	r3, .L21+24
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L22:
	.align	2
.L21:
	.word	seed
	.word	waitForVBlank
	.word	.LANCHOR0
	.word	oldButtons
	.word	buttons
	.word	srand
	.word	initGame
	.size	start, .-start
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L25
	mov	r2, #83886080
	ldr	r1, .L25+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L25+8
	ldr	r1, .L25+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	ldr	r1, .L25+16
	mov	r0, #3
	ldr	r3, .L25+20
	mov	lr, pc
	bx	r4
	ldr	r3, .L25+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L25+28
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L25+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L25+36
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L26:
	.align	2
.L25:
	.word	DMANow
	.word	pauseBGPal
	.word	100726784
	.word	pauseBGMap
	.word	pauseBGTiles
	.word	16400
	.word	waitForVBlank
	.word	hideSprites
	.word	shadowOAM
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L39
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	ldr	r2, .L39+4
	ldrh	r0, [r2]
	ldrh	r1, [r2, #4]
	strh	r0, [r3, #16]	@ movhi
	ldr	r2, .L39+8
	strh	r1, [r3, #18]	@ movhi
	ldrh	r3, [r2]
	tst	r3, #8
	beq	.L28
	ldr	r2, .L39+12
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L37
.L28:
	tst	r3, #4
	beq	.L27
	ldr	r3, .L39+12
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L38
.L27:
	pop	{r4, lr}
	bx	lr
.L38:
	pop	{r4, lr}
	b	goToStart
.L37:
	pop	{r4, lr}
	b	goToGame
.L40:
	.align	2
.L39:
	.word	waitForVBlank
	.word	.LANCHOR0
	.word	oldButtons
	.word	buttons
	.size	pause, .-pause
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L43
	mov	r2, #83886080
	ldr	r1, .L43+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L43+8
	ldr	r1, .L43+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	ldr	r1, .L43+16
	mov	r0, #3
	ldr	r3, .L43+20
	mov	lr, pc
	bx	r4
	ldr	r3, .L43+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L43+28
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L43+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r3, .L43+36
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L44:
	.align	2
.L43:
	.word	DMANow
	.word	winBGPal
	.word	100726784
	.word	winBGMap
	.word	winBGTiles
	.word	16400
	.word	waitForVBlank
	.word	hideSprites
	.word	shadowOAM
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L52
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	mov	r3, #67108864
	ldr	r2, .L52+4
	ldrh	r0, [r2]
	ldrh	r1, [r2, #4]
	strh	r0, [r3, #16]	@ movhi
	ldr	r2, .L52+8
	strh	r1, [r3, #18]	@ movhi
	ldrh	r3, [r2]
	tst	r3, #8
	beq	.L45
	ldr	r3, .L52+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L51
.L45:
	pop	{r4, lr}
	bx	lr
.L51:
	pop	{r4, lr}
	b	goToStart
.L53:
	.align	2
.L52:
	.word	waitForVBlank
	.word	.LANCHOR0
	.word	oldButtons
	.word	buttons
	.size	win, .-win
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L56
	mov	r2, #83886080
	ldr	r1, .L56+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L56+8
	ldr	r1, .L56+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	ldr	r1, .L56+16
	mov	r0, #3
	ldr	r3, .L56+20
	mov	lr, pc
	bx	r4
	ldr	r3, .L56+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L56+28
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L56+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L56+36
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L57:
	.align	2
.L56:
	.word	DMANow
	.word	loseBGPal
	.word	100726784
	.word	loseBGMap
	.word	loseBGTiles
	.word	16400
	.word	waitForVBlank
	.word	hideSprites
	.word	shadowOAM
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L81
	mov	lr, pc
	bx	r3
	ldr	r3, .L81+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L81+8
	mov	lr, pc
	bx	r3
	mov	r1, #67108864
	mov	r0, #0
	mov	r3, #512
	strh	r0, [r1, #16]	@ movhi
	mov	r2, #117440512
	strh	r0, [r1, #18]	@ movhi
	ldr	r4, .L81+12
	ldr	r1, .L81+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L81+20
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L59
	ldr	r2, .L81+24
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L78
.L59:
	ldr	r2, .L81+28
	ldr	r2, [r2]
	cmp	r2, #0
	beq	.L79
	tst	r3, #2
	bne	.L80
.L61:
	ldr	r3, .L81+32
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L62
	ldr	r3, .L81+36
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L58
.L62:
	pop	{r4, lr}
	b	goToLose
.L80:
	ldr	r3, .L81+24
	ldrh	r3, [r3]
	tst	r3, #2
	bne	.L61
	pop	{r4, lr}
	b	goToLose
.L79:
	pop	{r4, lr}
	b	goToWin
.L78:
	pop	{r4, lr}
	b	goToPause
.L58:
	pop	{r4, lr}
	bx	lr
.L82:
	.align	2
.L81:
	.word	updateGame
	.word	drawGame
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	oldButtons
	.word	buttons
	.word	enemiesRemaining
	.word	playerLives
	.word	enemiesPassed
	.size	game, .-game
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	mov	r2, #67108864
	mov	lr, #4352
	mov	ip, #7936
	mov	r0, #8
	mov	r1, #48
	ldr	r3, .L94
	strh	lr, [r2]	@ movhi
	strh	ip, [r2, #8]	@ movhi
	ldr	r2, .L94+4
	stm	r3, {r0, r1}
	mov	lr, pc
	bx	r2
	ldr	r6, .L94+8
	ldr	fp, .L94+12
	ldr	r5, .L94+16
	ldr	r10, .L94+20
	ldr	r9, .L94+24
	ldr	r8, .L94+28
	ldr	r7, .L94+32
	ldr	r4, .L94+36
.L84:
	ldr	r2, [r6]
	ldrh	r3, [fp]
.L85:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L85
.L87:
	.word	.L86
	.word	.L88
	.word	.L89
	.word	.L90
	.word	.L90
.L90:
	mov	lr, pc
	bx	r7
	b	.L84
.L89:
	mov	lr, pc
	bx	r8
	b	.L84
.L88:
	mov	lr, pc
	bx	r9
	b	.L84
.L86:
	mov	lr, pc
	bx	r10
	b	.L84
.L95:
	.align	2
.L94:
	.word	.LANCHOR0
	.word	goToStart
	.word	state
	.word	buttons
	.word	oldButtons
	.word	start
	.word	game
	.word	pause
	.word	win
	.word	67109120
	.size	main, .-main
	.text
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	win
	.size	lose, .-lose
	.comm	seed,4,4
	.global	vOff
	.global	hOff
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	hOff, %object
	.size	hOff, 4
hOff:
	.space	4
	.type	vOff, %object
	.size	vOff, 4
vOff:
	.space	4
	.ident	"GCC: (devkitARM release 47) 7.1.0"
