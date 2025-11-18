%include '../util.asm'
section		.text
global		_start

_start:
	mov	rdi, [var4]
	call	printint
	call	endl
	mov	rdi, [vet+16] ; 91 -> cada valor no dq tem 8 bytes, o inicio do terceiro eh apos 16 bytes
	call	printint
	call	endl
	call	exit0

section		.data

var1:	db	55	; byte (8 bits)
var2:	dw	5500	; word (16 bits)
var3:	dd	100000	; doubleword (32 bits)
var4:	dq	1232312 ; quadword (64 bits)
vet: 	dq 	1000, -5, 91, 314, 321
