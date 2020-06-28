%include	'../util.asm'
default rel
section		.text
global		_main

;
;rótulo no códugo é como se fosse funçao
;rótulo na área de dados é nome de variável
;
_main: ;rotulo inicio do programa

loop:    
    call readint

    cmp rax, [maior]
    jg condmaior  
    ;se nao for maior
    jmp fim
condmaior:
    mov [maior],rax
fim:
    cmp rax, 0
    jne loop
    mov rdi, [maior]
    call printint
    call endl
	call	exit   ; termina o programa

section		.data ; declaração de dados
;   int maior;
maior:		dq		0
            
