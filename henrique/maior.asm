%include	'../util.asm'

section		.text
global		_start

; comparacao de numeros, usando call para o maior

; a : r12
; b : r13
; c : r14

_start:
    lea     rdi, [msg]	; move o endereco da mensagem pro rdi
    call    printstr    ; printa a msg no endereco do rdi (primeiro argumento)
    call    readint     ; le o stdi e retorna no rax
    mov     r12, rax    ; faz copia do valor no rax para o a
    call    readint
    mov     r13, rax    ; b
    cmp     r12, r13    ; compara valores nas flags
    jng     else        ; jump se nao for maior
    call    maior       ; se for maior, chama funcao maior
    jmp     continua

maior:  ; a maior que b
    mov     r14, r12    ; c
    ret
else:
    mov     r14, r13    ; c
    jmp     continua

continua:
    lea     rdi, [msgMaior]
    call    printstr
    mov     rdi, r14
    call    printint    ; print c
    call    endl
    call    exit0
    
section		.data
msg:        db 'Informe dois valores: ', 10, 0    ; 10 eh quebra de linha,
msgMaior:   db 'Maior: ', 0