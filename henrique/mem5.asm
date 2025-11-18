%include '../util.asm'
section		.text
global		_start

_start:
	xor	r15, r15 ; int i = 0
.for:
	call	readint
	mov	[vet+r15*8], rax
	inc	r15	; i++
	cmp	r15, 10
	jl	.for	; i < 10
	call	endl
	dec	r15	; i++
.print:
	mov	rdi, [vet+r15*8]
	call	printint
	call	endl
	dec	r15	; i++
	cmp	r15, 0
	jge	.print ; i < 10
	call	exit0
	

section		.bss
vet:	resq	10
