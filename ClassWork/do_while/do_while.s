.section .rodata
	msg_main_enterNum:
	.string	"enter number\n"
	
	msg_main_scanf:
	.string	"%d"
	
	msg_main_loopPrint:
	.string	"%d\n"
	
.section .text
.globl	main
.type	main,	@function
main:
	pushl	%ebp
	movl	%esp,	%ebp

	subl	$8,	%esp
	
	pushl	$msg_main_enterNum
	call	printf
	addl	$4,	%esp
	
	leal	-4(%ebp),	%edx
	pushl	%edx
	pushl	$msg_main_scanf
	call	scanf
	addl	$8,	%esp
	
	movl	$0,	-8(%ebp)	#counter set to 0
	
	movl	-8(%ebp),	%eax	#iCounter move to eax
	jmp	label_do
	
label_do:
	pushl	%eax
	pushl	$msg_main_loopPrint
	call	printf
	addl	$8,	%esp
	addl	$1,	-8(%ebp)	#manipulation
	
	movl	-4(%ebp),	%edx	#iNo
	movl	-8(%ebp),	%eax	#iCounter
	cmpl	%edx,	%eax
	jl	label_do
	
	pushl	$0
	call	exit
