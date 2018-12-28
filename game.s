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
	.file	"game.c"
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBullet.part.2, %function
drawBullet.part.2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, [r0, #4]
	ldr	r2, [r0, #40]
	ldr	r4, [r0, #32]
	ldr	r1, [r0, #28]
	ldr	ip, .L4
	ldrb	lr, [r0]	@ zero_extendqisi2
	lsl	r2, r2, #3
	lsl	r3, r3, #23
	add	r1, r1, r4, lsl #5
	add	r0, ip, r2
	lsr	r3, r3, #23
	strh	lr, [ip, r2]	@ movhi
	strh	r3, [r0, #2]	@ movhi
	strh	r1, [r0, #4]	@ movhi
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	shadowOAM
	.size	drawBullet.part.2, .-drawBullet.part.2
	.set	drawEnemyBullet.part.3,drawBullet.part.2
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemy.part.4, %function
updateEnemy.part.4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r1, [r0, #4]
	ldr	r3, [r0, #12]
	ldr	r4, .L29
	add	r1, r1, r3
	sub	sp, sp, #20
	mov	r5, r0
	mov	r8, #0
	str	r1, [r0, #4]
	ldr	r9, .L29+4
	ldr	r7, .L29+8
	add	r6, r4, #480
	b	.L9
.L7:
	add	r4, r4, #48
	cmp	r4, r6
	beq	.L27
.L9:
	ldr	r3, [r4, #44]
	cmp	r3, #0
	beq	.L7
	ldr	lr, [r4, #16]
	ldr	ip, [r4, #20]
	ldr	r3, [r5, #16]
	ldr	r2, [r5, #20]
	ldr	r0, [r5]
	str	lr, [sp, #12]
	str	ip, [sp, #8]
	ldr	lr, [r4, #4]
	ldr	ip, [r4]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	ldrne	r3, [r7]
	strne	r8, [r5, #44]
	subne	r3, r3, #1
	strne	r8, [r4, #44]
	add	r4, r4, #48
	strne	r3, [r7]
	cmp	r4, r6
	ldr	r1, [r5, #4]
	bne	.L9
.L27:
	cmp	r1, #0
	ble	.L10
	ldr	r3, [r5, #16]
	add	r1, r1, r3
	cmp	r1, #239
	bgt	.L10
.L11:
	ldr	r2, .L29+12
	ldr	r3, [r5]
	ldr	r1, [r5, #20]
	ldr	r2, [r2]
	add	r3, r3, r1
	cmp	r3, r2
	movge	r2, #1
	ldrge	r3, .L29+16
	strge	r2, [r3]
	ldr	r3, .L29+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L29+24
	cmp	r0, r3
	bgt	.L14
	ldr	r0, .L29+28
	mov	r3, #0
	mov	r2, r0
.L16:
	ldr	r1, [r2, #44]
	cmp	r1, #0
	beq	.L28
	add	r3, r3, #1
	cmp	r3, #10
	add	r2, r2, #48
	bne	.L16
.L14:
	ldr	r2, [r5, #24]
	ldr	r3, .L29+32
	smull	r0, r1, r2, r3
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #3
	add	r3, r3, r3, lsl #2
	subs	r3, r2, r3, lsl #2
	bne	.L17
	ldr	r1, [r5, #32]
	cmp	r1, #1
	addne	r1, r1, #1
	streq	r3, [r5, #32]
	strne	r1, [r5, #32]
.L17:
	add	r2, r2, #1
	str	r2, [r5, #24]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L10:
	ldr	r0, [r5, #20]
	ldr	r3, .L29+36
	add	r0, r0, r0, lsr #31
	asr	r0, r0, #1
	add	r2, r3, #12
	add	ip, r3, #1440
.L12:
	ldr	r1, [r3, #12]
	rsb	r1, r1, #0
	str	r1, [r3, #12]
	ldr	r1, [r2, #-12]
	add	r3, r3, #48
	add	r1, r1, r0
	cmp	r3, ip
	str	r1, [r2, #-12]
	add	r2, r2, #48
	bne	.L12
	b	.L11
.L28:
	mov	lr, #1
	ldr	r2, [r5, #16]
	add	r3, r3, r3, lsl lr
	lsl	r3, r3, #4
	add	r1, r2, r2, lsr #31
	ldr	r2, [r5]
	add	ip, r0, r3
	str	r2, [r0, r3]
	ldr	r3, [r5, #4]
	ldr	r2, [ip, #16]
	add	r3, r3, r1, asr lr
	add	r2, r2, r2, lsr #31
	add	r3, r3, r2, asr lr
	str	r3, [ip, #4]
	str	lr, [ip, #44]
	b	.L14
.L30:
	.align	2
.L29:
	.word	bullets
	.word	collision
	.word	enemiesRemaining
	.word	player
	.word	enemiesPassed
	.word	rand
	.word	2097150
	.word	enemyBullets
	.word	1717986919
	.word	enemies
	.size	updateEnemy.part.4, .-updateEnemy.part.4
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawEnemy.part.5, %function
drawEnemy.part.5:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	add	r3, r0, #28
	ldm	r3, {r3, r4}
	ldr	r2, [r0, #40]
	ldr	r1, [r0]
	ldr	ip, .L33
	ldr	lr, [r0, #4]
	lsl	r2, r2, #3
	add	r3, r3, r4, lsl #4
	add	r0, ip, r2
	orr	r1, r1, #16384
	lsl	r3, r3, #1
	strh	lr, [r0, #2]	@ movhi
	strh	r1, [ip, r2]	@ movhi
	strh	r3, [r0, #4]	@ movhi
	pop	{r4, lr}
	bx	lr
.L34:
	.align	2
.L33:
	.word	shadowOAM
	.size	drawEnemy.part.5, .-drawEnemy.part.5
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r1, .L52
	ldr	r0, [r1, #32]
	ldr	r3, [r1, #28]
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r2, .L52+4
	ldr	r5, .L52+8
	add	r3, r3, r0, lsl #4
	lsl	r3, r3, #1
	ldm	r1, {r0, ip}
	ldr	lr, [r2, #32]
	strh	r3, [r5, #4]	@ movhi
	ldr	r3, [r2, #28]
	orr	r1, r0, #16384
	add	r3, r3, lr, lsl #5
	strh	r1, [r5]	@ movhi
	add	r0, r5, #484
	ldm	r2, {r1, r2}
	ldr	r4, .L52+12
	strh	r3, [r0]	@ movhi
	add	r3, r5, #480
	mov	r7, #512
	strh	ip, [r5, #2]	@ movhi
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	add	r6, r4, #480
	b	.L38
.L36:
	ldr	r3, [r4, #40]
	add	r4, r4, #48
	lsl	r3, r3, #3
	cmp	r4, r6
	strh	r7, [r5, r3]	@ movhi
	beq	.L49
.L38:
	ldr	r3, [r4, #44]
	cmp	r3, #0
	beq	.L36
	mov	r0, r4
	add	r4, r4, #48
	bl	drawBullet.part.2
	cmp	r4, r6
	bne	.L38
.L49:
	ldr	r4, .L52+16
	mov	r7, #512
	add	r6, r4, #480
	b	.L41
.L39:
	ldr	r3, [r4, #40]
	add	r4, r4, #48
	lsl	r3, r3, #3
	cmp	r4, r6
	strh	r7, [r5, r3]	@ movhi
	beq	.L50
.L41:
	ldr	r3, [r4, #44]
	cmp	r3, #0
	beq	.L39
	mov	r0, r4
	add	r4, r4, #48
	bl	drawEnemyBullet.part.3
	cmp	r4, r6
	bne	.L41
.L50:
	ldr	r4, .L52+20
	mov	r7, #512
	add	r6, r4, #1440
	b	.L44
.L42:
	ldr	r3, [r4, #40]
	add	r4, r4, #48
	lsl	r3, r3, #3
	cmp	r6, r4
	strh	r7, [r5, r3]	@ movhi
	beq	.L51
.L44:
	ldr	r3, [r4, #44]
	cmp	r3, #0
	beq	.L42
	mov	r0, r4
	add	r4, r4, #48
	bl	drawEnemy.part.5
	cmp	r6, r4
	bne	.L44
.L51:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L53:
	.align	2
.L52:
	.word	player
	.word	lives
	.word	shadowOAM
	.word	bullets
	.word	enemyBullets
	.word	enemies
	.size	drawGame, .-drawGame
	.align	2
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r2, #0
	mov	lr, #146
	mov	r1, #16
	mov	ip, #112
	mov	r0, #2
	ldr	r3, .L56
	str	lr, [r3]
	str	ip, [r3, #4]
	str	r0, [r3, #12]
	str	r2, [r3, #8]
	str	r2, [r3, #28]
	str	r2, [r3, #32]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	ldr	lr, [sp], #4
	bx	lr
.L57:
	.align	2
.L56:
	.word	player
	.size	initPlayer, .-initPlayer
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L59
	ldr	r1, [r2, #32]
	ldr	r3, [r2, #28]
	ldr	r0, [r2]
	add	r3, r3, r1, lsl #4
	ldr	ip, [r2, #4]
	ldr	r1, .L59+4
	lsl	r3, r3, #1
	orr	r2, r0, #16384
	strh	r3, [r1, #4]	@ movhi
	strh	r2, [r1]	@ movhi
	strh	ip, [r1, #2]	@ movhi
	bx	lr
.L60:
	.align	2
.L59:
	.word	player
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	initLives
	.syntax unified
	.arm
	.fpu softvfp
	.type	initLives, %function
initLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	mov	r1, #8
	mov	ip, #36
	mov	r0, #9
	ldr	r3, .L62
	str	r2, [r3]
	str	r2, [r3, #24]
	str	r2, [r3, #32]
	str	ip, [r3, #4]
	str	r0, [r3, #28]
	str	r1, [r3, #16]
	str	r1, [r3, #20]
	bx	lr
.L63:
	.align	2
.L62:
	.word	lives
	.size	initLives, .-initLives
	.align	2
	.global	updateLives
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateLives, %function
updateLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L68
	ldr	r3, [r3]
	cmp	r3, #2
	beq	.L67
	cmp	r3, #1
	moveq	r2, #11
	ldreq	r3, .L68+4
	streq	r2, [r3, #28]
	bx	lr
.L67:
	mov	r2, #10
	ldr	r3, .L68+4
	str	r2, [r3, #28]
	bx	lr
.L69:
	.align	2
.L68:
	.word	playerLives
	.word	lives
	.size	updateLives, .-updateLives
	.align	2
	.global	drawLives
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawLives, %function
drawLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L72
	add	r1, r2, #28
	str	lr, [sp, #-4]!
	ldr	r3, .L72+4
	ldm	r1, {r1, lr}
	ldr	ip, [r2]
	ldr	r0, [r2, #4]
	add	r2, r1, lr, lsl #5
	add	r1, r3, #484
	add	r3, r3, #480
	strh	r2, [r1]	@ movhi
	strh	ip, [r3]	@ movhi
	strh	r0, [r3, #2]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L73:
	.align	2
.L72:
	.word	lives
	.word	shadowOAM
	.size	drawLives, .-drawLives
	.align	2
	.global	initBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBullets, %function
initBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r2, #32
	mov	r4, #4
	mov	r0, #2
	mvn	lr, #3
	mov	r1, #0
	mov	ip, #8
	ldr	r3, .L80
.L75:
	str	r2, [r3, #40]
	add	r2, r2, #1
	cmp	r2, #42
	str	r4, [r3, #20]
	str	r0, [r3, #16]
	str	lr, [r3]
	str	r1, [r3, #4]
	str	r0, [r3, #8]
	str	r1, [r3, #44]
	str	r1, [r3, #24]
	str	ip, [r3, #28]
	str	r1, [r3, #32]
	add	r3, r3, #48
	bne	.L75
	mov	r5, #4
	mov	r4, #2
	mvn	lr, #3
	mov	r1, #0
	mov	ip, #1
	mov	r0, #12
	ldr	r3, .L80+4
.L76:
	str	r2, [r3, #40]
	add	r2, r2, #1
	cmp	r2, #52
	str	r5, [r3, #20]
	str	r4, [r3, #16]
	str	lr, [r3]
	stmib	r3, {r1, ip}
	str	r1, [r3, #44]
	str	r1, [r3, #24]
	str	r0, [r3, #28]
	str	r1, [r3, #32]
	add	r3, r3, #48
	bne	.L76
	pop	{r4, r5, lr}
	bx	lr
.L81:
	.align	2
.L80:
	.word	bullets
	.word	enemyBullets
	.size	initBullets, .-initBullets
	.align	2
	.global	fireBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireBullet, %function
fireBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L92
	mov	r3, #0
	mov	r2, r0
	b	.L85
.L83:
	add	r3, r3, #1
	cmp	r3, #10
	add	r2, r2, #48
	bxeq	lr
.L85:
	ldr	r1, [r2, #44]
	cmp	r1, #0
	bne	.L83
	push	{r4, lr}
	mov	r4, #1
	ldr	r2, .L92+4
	add	r3, r3, r3, lsl r4
	ldr	r1, [r2, #16]
	lsl	r3, r3, #4
	ldr	lr, [r2]
	ldr	r2, [r2, #4]
	add	ip, r0, r3
	add	r1, r1, r1, lsr #31
	add	r2, r2, r1, asr r4
	ldr	r1, [ip, #16]
	add	r1, r1, r1, lsr #31
	sub	lr, lr, #5
	add	r2, r2, r1, asr r4
	str	lr, [r0, r3]
	str	r4, [ip, #44]
	str	r2, [ip, #4]
	pop	{r4, lr}
	bx	lr
.L93:
	.align	2
.L92:
	.word	bullets
	.word	player
	.size	fireBullet, .-fireBullet
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	r3, .L112
	ldrh	r3, [r3, #48]
	tst	r3, #32
	sub	sp, sp, #20
	bne	.L95
	ldr	r3, .L112+4
	ldr	r2, [r3, #4]
	ldr	r1, [r3, #12]
	cmp	r2, r1
	subge	r2, r2, r1
	strge	r2, [r3, #4]
	blt	.L95
.L96:
	ldr	r3, .L112+8
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L97
	ldr	r3, .L112+12
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L110
.L97:
	ldr	r4, .L112+16
	ldr	r5, .L112+4
	ldr	r8, .L112+20
	ldr	r7, .L112+24
	add	r6, r4, #480
	b	.L101
.L99:
	add	r4, r4, #48
	cmp	r4, r6
	beq	.L111
.L101:
	ldr	r3, [r4, #44]
	cmp	r3, #0
	beq	.L99
	ldr	ip, [r4, #16]
	ldr	r9, [r4, #20]
	ldr	lr, [r4, #4]
	str	ip, [sp, #12]
	ldr	ip, [r4]
	ldr	r3, [r5, #16]
	ldr	r2, [r5, #20]
	ldm	r5, {r0, r1}
	str	r9, [sp, #8]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	movne	r2, #0
	ldrne	r3, [r7]
	strne	r2, [r4, #44]
	subne	r3, r3, #1
	add	r4, r4, #48
	strne	r3, [r7]
	cmp	r4, r6
	bne	.L101
.L111:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L95:
	ldr	r3, .L112
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L96
	ldr	r3, .L112+4
	add	r0, r3, #12
	ldr	r1, [r3, #4]
	ldm	r0, {r0, r2}
	add	r2, r1, r2
	rsb	ip, r0, #240
	cmp	r2, ip
	addle	r1, r1, r0
	strle	r1, [r3, #4]
	b	.L96
.L110:
	bl	fireBullet
	b	.L97
.L113:
	.align	2
.L112:
	.word	67109120
	.word	player
	.word	oldButtons
	.word	buttons
	.word	enemyBullets
	.word	collision
	.word	playerLives
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	bl	updatePlayer
	ldr	r3, .L138
	ldr	r3, [r3]
	cmp	r3, #2
	beq	.L134
	cmp	r3, #1
	moveq	r2, #11
	ldreq	r3, .L138+4
	streq	r2, [r3, #28]
.L116:
	ldr	r3, .L138+8
	mov	r0, #0
	add	r1, r3, #480
	b	.L120
.L118:
	add	r3, r3, #48
	cmp	r3, r1
	beq	.L135
.L120:
	ldr	r2, [r3, #44]
	cmp	r2, #0
	beq	.L118
	ldr	r2, [r3]
	sub	r2, r2, #1
	cmp	r2, #0
	str	r2, [r3]
	strle	r0, [r3, #44]
	add	r3, r3, #48
	cmp	r3, r1
	bne	.L120
.L135:
	ldr	r3, .L138+12
	mov	r0, #0
	add	r1, r3, #480
	b	.L124
.L122:
	add	r3, r3, #48
	cmp	r3, r1
	beq	.L136
.L124:
	ldr	r2, [r3, #44]
	cmp	r2, #0
	beq	.L122
	ldr	r2, [r3]
	add	r2, r2, #1
	cmp	r2, #159
	str	r2, [r3]
	strgt	r0, [r3, #44]
	add	r3, r3, #48
	cmp	r3, r1
	bne	.L124
.L136:
	ldr	r4, .L138+16
	add	r5, r4, #1440
	b	.L126
.L125:
	add	r4, r4, #48
	cmp	r5, r4
	beq	.L137
.L126:
	ldr	r3, [r4, #44]
	cmp	r3, #0
	beq	.L125
	mov	r0, r4
	add	r4, r4, #48
	bl	updateEnemy.part.4
	cmp	r5, r4
	bne	.L126
.L137:
	pop	{r4, r5, r6, lr}
	bx	lr
.L134:
	mov	r2, #10
	ldr	r3, .L138+4
	str	r2, [r3, #28]
	b	.L116
.L139:
	.align	2
.L138:
	.word	playerLives
	.word	lives
	.word	bullets
	.word	enemyBullets
	.word	enemies
	.size	updateGame, .-updateGame
	.align	2
	.global	fireEnemyBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireEnemyBullet, %function
fireEnemyBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L150
	mov	r3, #0
	mov	r2, ip
	b	.L143
.L141:
	add	r3, r3, #1
	cmp	r3, #10
	add	r2, r2, #48
	bxeq	lr
.L143:
	ldr	r1, [r2, #44]
	cmp	r1, #0
	bne	.L141
	push	{r4, r5, lr}
	mov	r4, #1
	ldr	r2, [r0, #16]
	add	r3, r3, r3, lsl r4
	add	r1, r2, r2, lsr #31
	lsl	r3, r3, #4
	ldr	r2, [r0, #4]
	add	lr, ip, r3
	add	r2, r2, r1, asr r4
	ldr	r1, [lr, #16]
	ldr	r5, [r0]
	add	r1, r1, r1, lsr #31
	add	r2, r2, r1, asr r4
	str	r5, [ip, r3]
	str	r2, [lr, #4]
	str	r4, [lr, #44]
	pop	{r4, r5, lr}
	bx	lr
.L151:
	.align	2
.L150:
	.word	enemyBullets
	.size	fireEnemyBullet, .-fireEnemyBullet
	.align	2
	.global	updateBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBullet, %function
updateBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #44]
	cmp	r3, #0
	bxeq	lr
	ldr	r3, [r0]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r0]
	movle	r3, #0
	strle	r3, [r0, #44]
	bx	lr
	.size	updateBullet, .-updateBullet
	.align	2
	.global	updateEnemyBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemyBullet, %function
updateEnemyBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #44]
	cmp	r3, #0
	bxeq	lr
	ldr	r3, [r0]
	add	r3, r3, #1
	cmp	r3, #159
	str	r3, [r0]
	movgt	r3, #0
	strgt	r3, [r0, #44]
	bx	lr
	.size	updateEnemyBullet, .-updateEnemyBullet
	.align	2
	.global	drawBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBullet, %function
drawBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r0, #44]
	cmp	r2, #0
	bne	.L162
	mov	r1, #512
	ldr	r3, [r0, #40]
	ldr	r2, .L163
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L162:
	b	drawBullet.part.2
.L164:
	.align	2
.L163:
	.word	shadowOAM
	.size	drawBullet, .-drawBullet
	.align	2
	.global	drawEnemyBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawEnemyBullet, %function
drawEnemyBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r0, #44]
	cmp	r2, #0
	bne	.L167
	mov	r1, #512
	ldr	r3, [r0, #40]
	ldr	r2, .L168
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L167:
	b	drawEnemyBullet.part.3
.L169:
	.align	2
.L168:
	.word	shadowOAM
	.size	drawEnemyBullet, .-drawEnemyBullet
	.align	2
	.global	initEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEnemies, %function
initEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #1
	mov	r2, #0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r1, ip
	mov	r9, r2
	mov	r0, ip
	mov	r8, ip
	mov	r7, #16
	mov	r6, #2
	ldr	r3, .L177
	ldr	lr, .L177+4
.L174:
	add	r2, r2, #1
	smull	r4, r5, r2, lr
	asr	r10, r2, #31
	sub	r4, r5, r10
	add	fp, r4, r4, lsl #1
	cmp	r2, fp, lsl #1
	add	r4, r1, r1, lsl #2
	moveq	r1, #1
	add	r5, r0, r0, lsl #2
	lsl	r5, r5, #2
	lsl	r4, r4, #2
	str	r5, [r3]
	str	r4, [r3, #4]
	smull	r4, r5, r2, lr
	rsb	r4, r10, r5, asr #1
	add	r4, r4, r4, lsl #1
	addne	r1, r1, #1
	addeq	r0, r0, r1
	cmp	r2, r4, lsl #2
	str	ip, [r3, #28]
	addeq	ip, ip, #1
	cmp	r2, #30
	str	r2, [r3, #40]
	str	r7, [r3, #20]
	str	r7, [r3, #16]
	str	r6, [r3, #8]
	str	r8, [r3, #12]
	str	r8, [r3, #44]
	str	r9, [r3, #24]
	str	r9, [r3, #32]
	str	r6, [r3, #36]
	add	r3, r3, #48
	bne	.L174
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L178:
	.align	2
.L177:
	.word	enemies
	.word	715827883
	.size	initEnemies, .-initEnemies
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #2
	push	{r4, r5, r6, lr}
	mov	ip, #9
	mov	r4, #0
	mov	lr, #36
	mov	r0, #16
	mov	r1, #8
	mov	r6, #146
	mov	r5, #112
	ldr	r3, .L181
	str	r2, [r3, #12]
	ldr	r2, .L181+4
	str	r6, [r3]
	str	lr, [r2, #4]
	str	ip, [r2, #28]
	str	r5, [r3, #4]
	str	r4, [r3, #8]
	str	r4, [r3, #28]
	str	r4, [r3, #32]
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	r4, [r2]
	str	r4, [r2, #24]
	str	r4, [r2, #32]
	str	r1, [r2, #16]
	str	r1, [r2, #20]
	ldr	r5, .L181+8
	bl	initBullets
	bl	initEnemies
	mov	r3, #256
	ldr	r2, .L181+12
	ldr	r1, .L181+16
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #16384
	ldr	r2, .L181+20
	ldr	r1, .L181+24
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r0, #3
	mov	r2, #30
	ldr	ip, .L181+28
	ldr	r1, .L181+32
	ldr	r3, .L181+36
	str	r4, [ip]
	str	r0, [r1]
	str	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L182:
	.align	2
.L181:
	.word	player
	.word	lives
	.word	DMANow
	.word	83886592
	.word	spritesheetPal
	.word	100728832
	.word	spritesheetTiles
	.word	enemiesPassed
	.word	playerLives
	.word	enemiesRemaining
	.size	initGame, .-initGame
	.align	2
	.global	updateEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemy, %function
updateEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #44]
	cmp	r3, #0
	bxeq	lr
	b	updateEnemy.part.4
	.size	updateEnemy, .-updateEnemy
	.align	2
	.global	drawEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawEnemy, %function
drawEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r0, #44]
	cmp	r2, #0
	bne	.L187
	mov	r1, #512
	ldr	r3, [r0, #40]
	ldr	r2, .L188
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L187:
	b	drawEnemy.part.5
.L189:
	.align	2
.L188:
	.word	shadowOAM
	.size	drawEnemy, .-drawEnemy
	.comm	shadowOAM,1024,4
	.comm	enemiesPassed,4,4
	.comm	enemiesRemaining,4,4
	.comm	playerLives,4,4
	.comm	enemies,1440,4
	.comm	enemyBullets,480,4
	.comm	bullets,480,4
	.comm	lives,48,4
	.comm	player,48,4
	.ident	"GCC: (devkitARM release 47) 7.1.0"
