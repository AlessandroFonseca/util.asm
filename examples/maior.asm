%include	'../util.asm'

section		.text
global		start

;int main()
;{
start: ;rotulo inicio do programa


;    cin >> n1 >> n2;
	call readint ; chama a função que lê um inteiro do terminal e retorna no eax
	mov [n1],eax ; copia o valor do retorno da função que está em eax para variavel n1
	call readint ; chama a função que lê um inteiro do terminal
	mov [n2],eax ;copia o valor do retorno da função que está em eax para variavel n2

	mov ebx, [n1]; copia conteudo da variável n1 para ebx 

	;a Instrução cmp não aceita comparação com endereço de memória somente com registradores
	;por isso copiamos o valor de n1 para ebx e o valor de n2 ja estava contido no eax
	cmp ebx,eax ; n1-n2
	jg parte_if ; jump if greater ( desvia se for maior )
parte_else:
	;   else m = n2; se nao for maior continua a execução aqui..
	mov [m],eax ; copia para a variavel m o eax que contem o valor da variavel n2
	jmp depois_do_if ; não pode executar a parte_if por isso pula para depois_do_if
;    if(n1>n2) m = n1;
parte_if: ;se for maior continua aqui 
	mov [m],ebx ; copia o valor de ebx que contem o n1 para a variavel m

depois_do_if: ; aqui imprimimos o valor no terminal
	mov edi,[m] ; copia o valor de m para edi pois o print int imprime no terminal o edi
	call printint ; imprime no terminal
	call endl ; chama a função endl para imprimir um enter
;    cout << m << endl;
;}
	call	exit   ; termina o programa

section		.data ; declaração de dados
;   int n1, n2, m;
n1:		dd		0
n2:		dd		0
m:		dd		0
            
