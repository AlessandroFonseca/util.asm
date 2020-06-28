%include	'../util.asm'

section		.text
global		start

start:
	lea		edi, [msg]
	call	printstr
	call	endl
	call	exit   

section		.data
msg:		db	'Hello, World!', 0	
            
