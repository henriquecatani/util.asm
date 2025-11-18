%include '../util.asm'
section		.text
global		_start

N:	equ 5

_start:
	mov	r15, N
.for:
	call	readint
	push	rax
	dec	r15	
	jnz	.for
	call	endl
	mov	r15, N
.print:
	pop	rdi
	call	printint
	call	endl
	dec	r15
	jnz	.print
	call	exit0
	
