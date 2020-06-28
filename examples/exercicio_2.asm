%include	'../util.asm'
default rel
section		.text
global		_main

;
;rótulo no código é como se fosse funçao
;rótulo na área de dados é nome de variável
;
_main: ;rotulo inicio do programa

    MOV rcx, 10

inicio: 
    push rcx ; pois readint usa o rcx
    call readint
    pop rcx
; aqui compara
    shr rax,1

    jc imp 
; qdo for par
    add [contpar], byte 1

    jmp depois


imp:
    add [contimpar], byte 1
depois:
    loop inicio




    mov rdi, [contpar]
    call printint
    call endl 
    mov rdi, [contimpar]
    call printint
    call endl
	call	exit   ; termina o programa

section		.data ; declaração de dados
;   int maior;
contpar:		dq		0
contimpar:		dq		0
