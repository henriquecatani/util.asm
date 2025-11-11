%include '../util.asm'
section	.text
global		_start

_start:
	lea	rdi, [prompt]
	call	printstr
	mov	r12, N
loop:
	call	readint
	dec	r12
	test	r12, r12
	jnz	loop
; TODO
section	.data
N	equ 5
prompt:		db 'Informe ', N + 48, 'valores: ', 10, 0;
