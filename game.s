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
	mov	r0, #140
	mov	lr, #2
	mov	r1, #118
	mov	r2, #5
	ldr	r3, .L4
	ldr	ip, .L4+4
	str	lr, [r3, #16]
	str	r0, [r3]
	str	r0, [r3, #8]
	strh	ip, [r3, #28]	@ movhi
	str	r1, [r3, #4]
	str	r1, [r3, #12]
	str	r2, [r3, #20]
	str	r2, [r3, #24]
	ldr	lr, [sp], #4
	bx	lr
.L5:
	.align	2
.L4:
	.word	player
	.word	15855
	.size	initPlayer, .-initPlayer
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
	@ link register save eliminated.
	ldr	r3, .L13
	ldrh	r3, [r3, #48]
	tst	r3, #32
	bne	.L7
	ldr	r2, .L13+4
	ldr	r3, [r2, #4]
	cmp	r3, #0
	blt	.L7
	ldr	r1, [r2, #16]
	sub	r3, r3, r1
	str	r3, [r2, #4]
	bx	lr
.L7:
	ldr	r3, .L13
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L9
	ldr	r2, .L13+4
	ldr	r1, [r2, #4]
	ldr	r3, [r2, #24]
	add	r3, r1, r3
	cmp	r3, #239
	ble	.L11
.L9:
	ldr	r3, .L13
	ldrh	r3, [r3, #48]
	tst	r3, #128
	beq	.L12
.L10:
	ldr	r3, .L13
	ldrh	r3, [r3, #48]
	tst	r3, #64
	bxne	lr
	ldr	r2, .L13+4
	ldr	r3, [r2]
	cmp	r3, #0
	ldrge	r1, [r2, #16]
	subge	r3, r3, r1
	strge	r3, [r2]
	bx	lr
.L12:
	ldr	r2, .L13+4
	ldr	r1, [r2]
	ldr	r3, [r2, #20]
	add	r3, r1, r3
	cmp	r3, #159
	bgt	.L10
	ldr	r3, [r2, #16]
	add	r1, r3, r1
	str	r1, [r2]
	bx	lr
.L11:
	ldr	r3, [r2, #16]
	add	r1, r3, r1
	str	r1, [r2, #4]
	bx	lr
.L14:
	.align	2
.L13:
	.word	67109120
	.word	player
	.size	updatePlayer, .-updatePlayer
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
	push	{r4, r5, lr}
	ldr	r4, .L17
	ldr	ip, .L17+4
	sub	sp, sp, #12
	add	r2, r4, #20
	add	r0, r4, #8
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r5, .L17+8
	str	ip, [sp]
	mov	lr, pc
	bx	r5
	ldrh	ip, [r4, #28]
	add	r2, r4, #20
	ldm	r2, {r2, r3}
	ldm	r4, {r0, r1}
	str	ip, [sp]
	mov	lr, pc
	bx	r5
	ldm	r4, {r2, r3}
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L18:
	.align	2
.L17:
	.word	player
	.word	10467
	.word	drawRect
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	initBalls
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBalls, %function
initBalls:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r9, #10
	ldr	r4, .L23
	ldr	r5, .L23+4
	ldr	r8, .L23+8
	ldr	r7, .L23+12
	add	r6, r4, #220
.L20:
	str	r9, [r4, #24]
	str	r9, [r4, #28]
	mov	lr, pc
	bx	r5
	smull	fp, ip, r0, r8
	asr	r2, r0, #31
	rsb	r3, r2, ip, asr #2
	rsb	r2, r3, r3, lsl #3
	rsb	r3, r3, r2, lsl #3
	sub	r3, r0, r3, lsl #1
	str	r3, [r4]
	mov	lr, pc
	bx	r5
	mov	lr, #31
	mov	r1, #1
	mov	ip, #0
	smull	r10, fp, r0, r7
	asr	r2, r0, lr
	rsb	r3, r2, fp, asr #6
	add	r3, r3, r3, lsl #6
	sub	r0, r0, r3, lsl r1
	ldr	r3, [r4]
	add	r0, r0, #10
	str	r0, [r4, #4]
	str	r0, [r4, #12]
	str	r1, [r4, #16]
	str	r1, [r4, #20]
	str	r1, [r4, #36]
	strh	lr, [r4, #32]	@ movhi
	str	ip, [r4, #40]
	str	r3, [r4, #8]
	add	r4, r4, #44
	cmp	r4, r6
	bne	.L20
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L24:
	.align	2
.L23:
	.word	balls
	.word	rand
	.word	156180629
	.word	2114445439
	.size	initBalls, .-initBalls
	.align	2
	.global	initGoals
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGoals, %function
initGoals:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r9, #10
	ldr	r4, .L29
	ldr	r5, .L29+4
	ldr	r8, .L29+8
	ldr	r7, .L29+12
	add	r6, r4, #220
.L26:
	str	r9, [r4, #24]
	str	r9, [r4, #28]
	mov	lr, pc
	bx	r5
	smull	fp, ip, r0, r8
	asr	r2, r0, #31
	rsb	r3, r2, ip, asr #2
	rsb	r2, r3, r3, lsl #3
	rsb	r3, r3, r2, lsl #3
	sub	r3, r0, r3, lsl #1
	str	r3, [r4]
	mov	lr, pc
	bx	r5
	mov	r1, #1
	mov	lr, #992
	mov	ip, #0
	smull	r10, fp, r0, r7
	asr	r2, r0, #31
	rsb	r3, r2, fp, asr #6
	add	r3, r3, r3, lsl #6
	sub	r0, r0, r3, lsl r1
	ldr	r3, [r4]
	add	r0, r0, #10
	str	r0, [r4, #4]
	str	r0, [r4, #12]
	str	r1, [r4, #16]
	str	r1, [r4, #20]
	str	r1, [r4, #36]
	strh	lr, [r4, #32]	@ movhi
	str	ip, [r4, #40]
	str	r3, [r4, #8]
	add	r4, r4, #44
	cmp	r4, r6
	bne	.L26
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L30:
	.align	2
.L29:
	.word	goals
	.word	rand
	.word	156180629
	.word	2114445439
	.size	initGoals, .-initGoals
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
	push	{r4, lr}
	mov	r1, #140
	mov	r2, #118
	mov	r4, #5
	mov	ip, #2
	ldr	r3, .L33
	ldr	r0, .L33+4
	str	r4, [r3, #20]
	str	r4, [r3, #24]
	str	r1, [r3]
	str	r1, [r3, #8]
	str	ip, [r3, #16]
	strh	r0, [r3, #28]	@ movhi
	str	r2, [r3, #4]
	str	r2, [r3, #12]
	bl	initBalls
	bl	initGoals
	ldr	r3, .L33+8
	str	r4, [r3]
	pop	{r4, lr}
	bx	lr
.L34:
	.align	2
.L33:
	.word	player
	.word	15855
	.word	goalsRemaining
	.size	initGame, .-initGame
	.align	2
	.global	drawBall
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBall, %function
drawBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r3, [r0, #36]
	cmp	r3, #0
	sub	sp, sp, #12
	mov	r4, r0
	bne	.L39
	ldr	r3, [r0, #40]
	cmp	r3, #0
	beq	.L40
.L37:
	ldm	r4, {r2, r3}
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L40:
	ldr	ip, .L41
	add	r2, r0, #24
	add	r0, r0, #8
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r5, .L41+4
	str	ip, [sp]
	mov	lr, pc
	bx	r5
	mov	r3, #1
	str	r3, [r4, #40]
	b	.L37
.L39:
	ldr	ip, .L41
	add	r2, r0, #24
	add	r0, r0, #8
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r5, .L41+4
	str	ip, [sp]
	mov	lr, pc
	bx	r5
	ldrh	ip, [r4, #32]
	add	r2, r4, #24
	ldm	r2, {r2, r3}
	ldm	r4, {r0, r1}
	str	ip, [sp]
	mov	lr, pc
	bx	r5
	b	.L37
.L42:
	.align	2
.L41:
	.word	10467
	.word	drawRect
	.size	drawBall, .-drawBall
	.align	2
	.global	drawGoal
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGoal, %function
drawGoal:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r3, [r0, #36]
	cmp	r3, #0
	sub	sp, sp, #12
	mov	r4, r0
	bne	.L47
	ldr	r3, [r0, #40]
	cmp	r3, #0
	beq	.L48
.L45:
	ldm	r4, {r2, r3}
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L48:
	ldr	ip, .L49
	add	r2, r0, #24
	add	r0, r0, #8
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r5, .L49+4
	str	ip, [sp]
	mov	lr, pc
	bx	r5
	mov	r3, #1
	str	r3, [r4, #40]
	b	.L45
.L47:
	ldr	ip, .L49
	add	r2, r0, #24
	add	r0, r0, #8
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r5, .L49+4
	str	ip, [sp]
	mov	lr, pc
	bx	r5
	ldrh	ip, [r4, #32]
	add	r2, r4, #24
	ldm	r2, {r2, r3}
	ldm	r4, {r0, r1}
	str	ip, [sp]
	mov	lr, pc
	bx	r5
	b	.L45
.L50:
	.align	2
.L49:
	.word	10467
	.word	drawRect
	.size	drawGoal, .-drawGoal
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
	push	{r4, r5, r6, lr}
	bl	drawPlayer
	ldr	r4, .L67
	add	r5, r4, #220
.L53:
	ldr	r3, [r4, #36]
	cmp	r3, #0
	bne	.L65
.L52:
	add	r4, r4, #44
	cmp	r4, r5
	bne	.L53
	ldr	r4, .L67+4
	add	r5, r4, #220
.L55:
	ldr	r3, [r4, #36]
	cmp	r3, #0
	bne	.L66
.L54:
	add	r4, r4, #44
	cmp	r4, r5
	bne	.L55
	pop	{r4, r5, r6, lr}
	bx	lr
.L66:
	mov	r0, r4
	bl	drawGoal
	b	.L54
.L65:
	mov	r0, r4
	bl	drawBall
	b	.L52
.L68:
	.align	2
.L67:
	.word	balls
	.word	goals
	.size	drawGame, .-drawGame
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGoal.part.1, %function
updateGoal.part.1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r3, [r0]
	cmp	r3, #0
	sub	sp, sp, #20
	mov	r4, r0
	ldr	lr, [r0, #24]
	ldr	r1, [r0, #16]
	ble	.L70
	add	r2, r3, lr
	cmp	r2, #160
	bgt	.L70
.L71:
	ldr	r2, [r4, #4]
	cmp	r2, #0
	ldr	r5, [r4, #28]
	ldr	ip, [r4, #20]
	ble	.L72
	add	r0, r2, r5
	cmp	r0, #239
	bgt	.L72
.L73:
	ldr	r0, .L79
	add	r1, r3, r1
	add	ip, r2, ip
	ldr	r3, [r0, #24]
	ldr	r2, [r0, #20]
	str	r1, [r4]
	str	r1, [sp]
	ldm	r0, {r0, r1}
	str	ip, [r4, #4]
	str	r5, [sp, #12]
	str	ip, [sp, #4]
	str	lr, [sp, #8]
	ldr	r5, .L79+4
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L69
	mov	r3, #0
	mov	r2, #300
	str	r3, [r4, #36]
	str	r3, [r4, #40]
	str	r2, [r4, #4]
	mov	r0, r4
	bl	drawGoal
	ldr	r2, .L79+8
	ldr	r3, [r2]
	sub	r3, r3, #1
	str	r3, [r2]
.L69:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L72:
	rsb	ip, ip, #0
	str	ip, [r4, #20]
	b	.L73
.L70:
	rsb	r1, r1, #0
	str	r1, [r4, #16]
	b	.L71
.L80:
	.align	2
.L79:
	.word	player
	.word	collision
	.word	goalsRemaining
	.size	updateGoal.part.1, .-updateGoal.part.1
	.align	2
	.global	updateGoal
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGoal, %function
updateGoal:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #36]
	cmp	r3, #0
	bxeq	lr
	b	updateGoal.part.1
	.size	updateGoal, .-updateGoal
	.align	2
	.global	deactivateAllMovingObjects
	.syntax unified
	.arm
	.fpu softvfp
	.type	deactivateAllMovingObjects, %function
deactivateAllMovingObjects:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r5, #0
	ldr	r4, .L89
	ldr	r7, .L89+4
	add	r6, r4, #220
.L84:
	str	r5, [r4, #36]
	str	r5, [r4, #40]
	strh	r7, [r4, #32]	@ movhi
	mov	r0, r4
	add	r4, r4, #44
	bl	drawBall
	cmp	r4, r6
	bne	.L84
	mov	r5, #0
	ldr	r4, .L89+8
	ldr	r7, .L89+4
	add	r6, r4, #220
.L85:
	str	r5, [r4, #36]
	str	r5, [r4, #40]
	strh	r7, [r4, #32]	@ movhi
	mov	r0, r4
	add	r4, r4, #44
	bl	drawGoal
	cmp	r6, r4
	bne	.L85
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L90:
	.align	2
.L89:
	.word	balls
	.word	10467
	.word	goals
	.size	deactivateAllMovingObjects, .-deactivateAllMovingObjects
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBall.part.2, %function
updateBall.part.2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r3, [r0]
	cmp	r3, #0
	sub	sp, sp, #20
	mov	r4, r0
	ldr	lr, [r0, #24]
	ldr	r1, [r0, #16]
	ble	.L92
	add	r2, r3, lr
	cmp	r2, #160
	bgt	.L92
.L93:
	ldr	r2, [r4, #4]
	cmp	r2, #0
	ldr	r5, [r4, #28]
	ldr	ip, [r4, #20]
	ble	.L94
	add	r0, r2, r5
	cmp	r0, #239
	bgt	.L94
.L95:
	ldr	r0, .L101
	add	r1, r3, r1
	add	ip, r2, ip
	ldr	r3, [r0, #24]
	ldr	r2, [r0, #20]
	str	r1, [r4]
	str	r1, [sp]
	ldm	r0, {r0, r1}
	str	ip, [r4, #4]
	str	r5, [sp, #12]
	str	ip, [sp, #4]
	str	lr, [sp, #8]
	ldr	r5, .L101+4
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	beq	.L91
	bl	deactivateAllMovingObjects
	mov	r0, r4
	bl	drawBall
	ldr	r3, .L101+8
	mov	lr, pc
	bx	r3
.L91:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L94:
	rsb	ip, ip, #0
	str	ip, [r4, #20]
	b	.L95
.L92:
	rsb	r1, r1, #0
	str	r1, [r4, #16]
	b	.L93
.L102:
	.align	2
.L101:
	.word	player
	.word	collision
	.word	goToLose
	.size	updateBall.part.2, .-updateBall.part.2
	.align	2
	.global	updateBall
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBall, %function
updateBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #36]
	cmp	r3, #0
	bxeq	lr
	b	updateBall.part.2
	.size	updateBall, .-updateBall
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
	push	{r4, r5, r6, r7, r8, lr}
	bl	updatePlayer
	mov	r4, #36
	ldr	r6, .L119
	ldr	r5, .L119+4
	sub	r8, r6, #36
	sub	r7, r5, #36
.L108:
	ldr	r3, [r6, r4]
	cmp	r3, #0
	bne	.L117
.L106:
	ldr	r3, [r5, r4]
	cmp	r3, #0
	bne	.L118
.L107:
	add	r4, r4, #44
	cmp	r4, #256
	bne	.L108
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L118:
	add	r0, r7, r4
	bl	updateGoal.part.1
	b	.L107
.L117:
	add	r0, r8, r4
	bl	updateBall.part.2
	b	.L106
.L120:
	.align	2
.L119:
	.word	balls
	.word	goals
	.size	updateGame, .-updateGame
	.comm	goalsRemaining,4,4
	.comm	goals,220,4
	.comm	balls,220,4
	.comm	player,32,4
	.ident	"GCC: (devkitARM release 47) 7.1.0"
