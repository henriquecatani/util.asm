section		.text
global		fatorial, menor, maior
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


menor: ; rdi, rsi 
; retorna no rax o menor entre os dois	
	cmp	rdi, rsi
	cmovle	rax, rdi
	cmovg	rax, rsi
	ret
maior: ; rdi, rsi 
; retorna no rax o maior entre os dois	
	cmp	rdi, rsi
	cmovle	rax, rsi
	cmovg	rax, rdi
	ret

