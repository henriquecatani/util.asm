%include        '../util.asm'
extern		fatorial	; isso vai ser tratado pelo linker
section         .text
global          _start
 
_start:
	lea     rdi, [prompt]
        call    printstr        
        call    readint
	mov	rdi, rax		
	call	fatorial
	mov	rdi, rax
	call	printint
	call	endl
	call	exit0
section         .data
prompt:         db 'Insira um valor: ', 0
