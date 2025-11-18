%include '../util.asm'
section		.text
global		_start

_start:
	xor	r15, r15 ; int i = 0
	xor	r14, r14
.for:
	call	readint
	mov	[vet+r15*8], rax
	inc	r15	; i++
	cmp	r15, 10
	jl	.for	; i < 10

	call	endl
.print:
	mov	rdi, [vet+r14*8]
	call	printint
	call	endl
	inc	r14	; i++
	cmp	r14, 10
	jl	.print ; i < 10
	call	exit0
	

section		.bss
vet:	resq	10
