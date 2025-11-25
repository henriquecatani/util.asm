%include	'../util.asm'

section		.text
global		_start
_start:
	pop	rdi	; no topo da pilha fica a quantidade de args passados na linha de comando
	mov	rbx, rdi
	call	printint
	call	endl

.loop:
	pop	rdi
	call	printstr
	call	endl
	dec	rbx
	jnz	.loop
	call	exit0
