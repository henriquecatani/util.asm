%include        '../util.asm'
 
section         .text
global          _start
 
_start:
	lea     rdi, [prompt]
        call    printstr        
        call    readint
	cmp	rax, 1
	jle	zero
        mov	r12, rax
	dec	rax
	call	fatorial
	mov	rdi, r12
	call	printint
	call	endl
	call	exit0
fatorial:
	imul	r12, rax
	dec	rax
	jnz	fatorial
	ret
zero:
	mov	rdi, 1 
	call	printint
	call	endl
	call	exit0

section         .data
prompt:         db 'Insira um valor: ', 0
