%include	'../util.asm'
default rel
section		.text
global		_main


;
_main: ;rotulo inicio do programa
mov r10,0
loop: 

    call readint
    Add r10,1
    mov rcx,0
    cmp rax,rcx
    ;Add rbx,1
    jge continua  
   
    jmp fim
continua:
jmp loop

    ;mov [maior],rax
fim:
    mov rdi, r10
    call printint
    call endl
	call	exit   ; termina o programa



section		.data ; declaração de dados
            
