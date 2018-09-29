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
	.file	"main.c"
	.text
	.align	2
	.global	startState
	.syntax unified
	.arm
	.fpu softvfp
	.type	startState, %function
startState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r2, .L9
	ldr	r4, .L9+4
	ldrh	r2, [r2]
	ldr	r3, [r4]
	tst	r2, #1
	add	r3, r3, #1
	str	r3, [r4]
	beq	.L1
	ldr	r3, .L9+8
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L8
.L1:
	pop	{r4, lr}
	bx	lr
.L8:
	ldr	r0, .L9+12
	ldr	r3, .L9+16
	mov	lr, pc
	bx	r3
	mov	r1, #1
	ldr	r2, .L9+20
	ldr	r0, [r4]
	ldr	r3, .L9+24
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L9+28
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L10:
	.align	2
.L9:
	.word	oldButtons
	.word	seed
	.word	buttons
	.word	10467
	.word	fillScreen
	.word	state
	.word	srand
	.word	initGame
	.size	startState, .-startState
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
	ldr	r0, .L13
	ldr	r3, .L13+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L13+8
	mov	r3, #0
	ldr	r2, .L13+12
	mov	r1, #100
	mov	r0, #80
	mov	lr, pc
	bx	r4
	mov	r2, #0
	ldr	r3, .L13+16
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L14:
	.align	2
.L13:
	.word	32767
	.word	fillScreen
	.word	drawString
	.word	.LC0
	.word	state
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
	@ link register save eliminated.
	mov	r3, #67108864
	ldr	r2, .L16
	strh	r2, [r3]	@ movhi
	b	goToStart
.L17:
	.align	2
.L16:
	.word	1027
	.size	initialize, .-initialize
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	winState.part.2, %function
winState.part.2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L20
	ldrh	r3, [r3]
	tst	r3, #1
	bxne	lr
	b	goToStart
.L21:
	.align	2
.L20:
	.word	buttons
	.size	winState.part.2, .-winState.part.2
	.set	loseState.part.3,winState.part.2
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
	ldr	r3, .L24
	ldr	r0, .L24+4
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L24+8
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L25:
	.align	2
.L24:
	.word	fillScreen
	.word	10467
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	pauseState
	.syntax unified
	.arm
	.fpu softvfp
	.type	pauseState, %function
pauseState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L38
	ldrh	r3, [r4]
	tst	r3, #1
	beq	.L27
	ldr	r2, .L38+4
	ldrh	r2, [r2]
	tst	r2, #1
	beq	.L36
.L27:
	tst	r3, #4
	beq	.L26
	ldr	r3, .L38+4
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L37
.L26:
	pop	{r4, lr}
	bx	lr
.L37:
	pop	{r4, lr}
	b	goToStart
.L36:
	ldr	r3, .L38+8
	ldr	r0, .L38+12
	mov	lr, pc
	bx	r3
	mov	r1, #1
	ldr	r2, .L38+16
	ldrh	r3, [r4]
	str	r1, [r2]
	b	.L27
.L39:
	.align	2
.L38:
	.word	oldButtons
	.word	buttons
	.word	fillScreen
	.word	10467
	.word	state
	.size	pauseState, .-pauseState
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
	ldr	r0, .L42
	ldr	r3, .L42+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L42+8
	ldr	r3, .L42+12
	ldr	r2, .L42+16
	mov	r1, #100
	mov	r0, #80
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L42+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L43:
	.align	2
.L42:
	.word	32665
	.word	fillScreen
	.word	drawString
	.word	32767
	.word	.LC1
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	winState
	.syntax unified
	.arm
	.fpu softvfp
	.type	winState, %function
winState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L46
	ldrh	r3, [r3]
	tst	r3, #1
	bxeq	lr
	b	winState.part.2
.L47:
	.align	2
.L46:
	.word	oldButtons
	.size	winState, .-winState
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
	ldr	r0, .L50
	ldr	r3, .L50+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L50+8
	ldr	r3, .L50+12
	ldr	r2, .L50+16
	mov	r1, #100
	mov	r0, #80
	mov	lr, pc
	bx	r4
	mov	r2, #3
	ldr	r3, .L50+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L51:
	.align	2
.L50:
	.word	32733
	.word	fillScreen
	.word	drawString
	.word	32665
	.word	.LC2
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	loseState
	.syntax unified
	.arm
	.fpu softvfp
	.type	loseState, %function
loseState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	winState
	.size	loseState, .-loseState
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
	ldr	r0, .L55
	ldr	r3, .L55+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L55+8
	ldr	r3, .L55+12
	ldr	r2, .L55+16
	mov	r1, #100
	mov	r0, #80
	mov	lr, pc
	bx	r4
	mov	r2, #4
	ldr	r3, .L55+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L56:
	.align	2
.L55:
	.word	13727
	.word	fillScreen
	.word	drawString
	.word	32767
	.word	.LC3
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	gameState
	.syntax unified
	.arm
	.fpu softvfp
	.type	gameState, %function
gameState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L71
	mov	lr, pc
	bx	r3
	ldr	r4, .L71+4
	ldr	r3, .L71+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L71+12
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #1
	beq	.L58
	ldr	r2, .L71+16
	ldrh	r2, [r2]
	tst	r2, #1
	beq	.L68
.L58:
	tst	r3, #2
	beq	.L59
	ldr	r3, .L71+16
	ldrh	r3, [r3]
	tst	r3, #2
	beq	.L69
.L59:
	ldr	r3, .L71+20
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L70
	pop	{r4, lr}
	bx	lr
.L70:
	pop	{r4, lr}
	b	goToWin
.L69:
	bl	goToLose
	b	.L59
.L68:
	bl	goToPause
	ldrh	r3, [r4]
	b	.L58
.L72:
	.align	2
.L71:
	.word	updateGame
	.word	oldButtons
	.word	waitForVBlank
	.word	drawGame
	.word	buttons
	.word	goalsRemaining
	.size	gameState, .-gameState
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
	mov	r2, #67108864
	ldr	r1, .L89
	push	{r4, r7, fp, lr}
	ldr	r3, .L89+4
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	fp, .L89+8
	ldr	r5, .L89+12
	ldr	r9, .L89+16
	ldr	r8, .L89+20
	ldr	r7, .L89+24
	ldr	r6, .L89+28
	ldr	r10, .L89+32
	ldr	r4, .L89+36
.L74:
	ldrh	r2, [fp]
	strh	r2, [r5]	@ movhi
	ldr	r3, [r9]
	ldrh	r1, [r4, #48]
	strh	r1, [fp]	@ movhi
	cmp	r3, #4
	ldrls	pc, [pc, r3, asl #2]
	b	.L74
.L77:
	.word	.L76
	.word	.L78
	.word	.L79
	.word	.L80
	.word	.L81
.L81:
	tst	r2, #1
	beq	.L74
	ldr	r3, .L89+40
	mov	lr, pc
	bx	r3
	b	.L74
.L80:
	tst	r2, #1
	beq	.L74
	mov	lr, pc
	bx	r10
	b	.L74
.L78:
	mov	lr, pc
	bx	r7
	b	.L74
.L79:
	mov	lr, pc
	bx	r6
	b	.L74
.L76:
	mov	lr, pc
	bx	r8
	b	.L74
.L90:
	.align	2
.L89:
	.word	1027
	.word	goToStart
	.word	buttons
	.word	oldButtons
	.word	state
	.word	startState
	.word	gameState
	.word	pauseState
	.word	winState.part.2
	.word	67109120
	.word	loseState.part.3
	.size	main, .-main
	.comm	seed,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"START\000"
	.space	2
.LC1:
	.ascii	"PAUSE\000"
	.space	2
.LC2:
	.ascii	"YOU WIN!\000"
	.space	3
.LC3:
	.ascii	"YOU LOSE!\000"
	.ident	"GCC: (devkitARM release 47) 7.1.0"
