; Henrique Bottan Catani 210305
%include '../util.asm'
section	.text
global		_start

_start:
	lea	rdi, [prompt]
	call	printstr
	mov	r12, N		; contador para dedcrementar
	call	readint
	mov	r13, rax	; cin >> input >> menor >> maior
	mov	r14, rax
	mov	r15, rax
	jmp	.decrementar	; pois ja esta definido o maior e menor desse input
.loop:
	call	readint
	mov	r15, rax	; r15 = input
	mov	rdi, r15 
	mov	rsi, r13
	call	menor		; funcao menor(rdi, rsi) -> rax
	mov	r13, rax	; r13 = menor
	mov	rdi, r15
	mov	rsi, r14
	call	maior		; funcao menor(rdi, rsi) -> rax
	mov	r14, rax	; r14 = maior
.decrementar:
	dec	r12
	test	r12, r12
	jnz	.loop
.fim: ; printar result
	lea	rdi, [result]
	call	printstr
	sub	r14, r13	; periodo = maior - menor
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

section	.data
N	equ 5
prompt:		db 'Informe ', N + 48, ' valores: ', 10, 0;
result:		db 'Periodo: ', 0;
