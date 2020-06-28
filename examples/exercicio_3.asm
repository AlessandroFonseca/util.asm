%include	'../util.asm'
default rel
section		.text
global		_main

;
;rótulo no código é como se fosse funçao
;rótulo na área de dados é nome de variável
;
_main: ;rotulo inicio do programa
    mov r10, 0
    leitura:
    call readint
    
    lea rdi, [inteiros]
    mov [rdi+r10*8], rax 

    add r10, 1
    cmp r10, 8
    je continua
    jmp leitura
    continua:
    mov r10, 0
    proximaleitura:
    lea rdi, [inteiros]
    mov rax, [rdi+r10*8]
    mov rbx, 3
    mov rdx, 0 ;https://stackoverflow.com/questions/32927651/x86-assembly-nasm-floating-point-exception-not-dividing-by-0
    idiv rbx ; rax= rax/rbx ; rdx = rax%rbx
    cmp rdx,0
    je multiplo
    jmp continua2
    multiplo:
    mov r9, [rdi+r10*8]
    continua2:

    add r10, 1 ; incrementar a pos vet
    cmp r10, 8 ; compara se percorreu todo
    je mostraultimo
    jmp proximaleitura
    mostraultimo:
    call endl
    mov rdi, r9
    call printint
    call endl


	call	exit   ; termina o programa

section		.bss; declaração de dados
;   int maior;
inteiros:		resq		8

