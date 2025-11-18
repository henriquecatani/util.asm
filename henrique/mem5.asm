%include '../util.asm'
section		.text
global		_start

N:	equ 5

_start:
	xor	r15, r15 ; int i = 0
.for:
	call	readint
	mov	[vet+r15*8], rax
	inc	r15	; i++
	cmp	r15, N
	jl	.for	; i < 10
	call	endl
.print:
	dec	r15	; i--
	mov	rdi, [vet+r15*8]
	call	printint
	call	endl
	cmp	r15, 0
	jg	.print ; i < 10
	call	exit0
	

section		.bss
vet:	resq	N
