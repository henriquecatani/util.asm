section		.text
global		fatorial
fatorial:
        mov     rax, 1 
.ini:
        cmp     rdi, 1
        jle     .fim	; se rdi for menor ou igual a 1, pula pro fim
	imul    rax, rdi
        dec     rdi
	jmp	.ini

.fim: ; ponto indica label local
	ret
