%include        '../util.asm'
 
section         .text
global          _start
 
_start:
	xor	r12, r12
main:
	lea     rdi, [prompt]
        call    printstr        
        call    readint
	test	rax, rax
	jz	endprogram
        test	rax, 1	;test vai verificar se rax eh par ou impar. se ZF=1, eh impar
        jnz	impar
	jmp	main
impar:
	inc	r12
	jmp	main

endprogram:
	mov	rdi, r12
	call	printint
	call	endl
	call	exit0

section         .data
prompt:         db 'Input a number: ', 0
