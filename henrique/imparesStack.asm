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
	push	rax
	jmp	main

endprogram:
	mov	rdi, [qntImparesStr]
	call	printstr
	mov	rdi, r12
	call	printint
	call	endl
	call	printstack
	call	exit0

printstack:
	call	endl
	pop	rdi
	call	printint
	test	rsp, rsp
	jnz	printstack
	ret

section         .data
prompt:         db 'Input a number: ', 0
qntImparesStr:	db 'Quantidade de Impares: ', 0
