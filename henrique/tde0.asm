; Henrique Bottan Catani 210305
%include '../util.asm'
section	.text
global		_start

_start:
	lea	rdi, [prompt]
	call	printstr
	mov	r12, N
	call	readint
	mov	r13, rax
	mov	r14, rax
	mov	r15, rax
	jmp	loop_noinput
loop:
	call	readint
	mov	r15, rax	; r15 = input
loop_noinput: 
	mov	rdi, r15 
	mov	rsi, r13
	call	menor
	mov	r13, rax	; r13 = menor
	mov	rdi, r15
	mov	rsi, r14
	call	maior
	mov	r14, rax	; r14 = maior
	dec	r12
	test	r12, r12
	jnz	loop
fim: ; printar result
	lea	rdi, [result]
	call	printstr
	sub	r14, r13
	mov	rdi, r14
	call	printint
	call	endl
	call	exit0


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


;    O programa deve ter, no mínimo, mais uma função além da principal (_start) , respeitando completamente a convenção de chamada estudada (System-V ABI), além de uma terceira função "extract" que testa se um valor passado por parâmetro é impar e negativo.
;    Entregar apenas um arquivo tde2.asm contendo todo o código, sem compactar.

section	.data
N	equ 5
prompt:		db 'Informe ', N + 48, ' valores: ', 10, 0;
result:		db 'Periodo: ', 0;
