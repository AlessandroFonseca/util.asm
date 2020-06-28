%include	'../util.asm'
default rel
section		.text
global		_main

;
;rótulo no código é como se fosse funçao
;rótulo na área de dados é nome de variável
;
_main: ;rotulo inicio do programa
   
;lea rdi, [fibonacci]
mov qword [fibonacci], 0 
mov qword [fibonacci+1*8],1
mov r10, 2
laco:
lea r15, [fibonacci]
mov r9, [r15+(r10-1)*8]
mov r8, [r15+(r10-2)*8]
add r8,r9
lea r15, [fibonacci]
mov [r15+r10*8], r8
;mov rdi, r8
;call printint
;call endl
Add r10,1


cmp r10,10

je imprime
jmp laco

;| 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 |
;| 0 | 1 |   |   |   |   |   |   |   |   |   
; r10 = 2
; r15 = 0xDEF4
; r9 = 1
; r8 = 0

imprime:
mov r10,0 
continua:
mov r12, [r15+r10*8]
mov rdi, r12
call printint
call endl
add r10,1
cmp r10,10
jne continua
	call	exit   ; termina o programa

section		.bss; declaração de dados
;   int maior;
fibonacci:		resq		10

