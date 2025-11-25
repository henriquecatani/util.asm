section		.text
global		_start

SYSEXIT:	equ	60	; exit syscall
SYSRENAME:	equ	82	
SYSWRITE:	equ	1
STDOUT:		equ	1
STDERR:		equ	2
EXITSUCCESS:	equ	0	
EXITERROR:	equ	1
_start:
	pop	rax	;argc = args counter
	cmp	rax, 3
	jne	.error
	mov	rax, SYSRENAME
	pop	rdi
	pop	rdi
	pop	rsi
	syscall
	call	exit0

.error:
	mov	rax, SYSWRITE	; syscall escrever
	mov	rdi, STDERR	; para onde escrever, stderr
	lea	rsi, errormsg	; o que escrever
	mov	rdx, errormsgsize  ; quantidade de bytes a serem escritos, calculado pelo NASM
	syscall
	call exit1


exit1:
	mov	rdi, EXITERROR
	mov	rax, SYSEXIT
	syscall
	
exit0:
	mov	rdi, EXITSUCCESS 
	mov	rax, SYSEXIT
	syscall

section		.data
errormsg:	db	'Sintaxe do comando: rename nomeAntigo nomeNovo', 10
errormsgsize:	equ $-errormsg
