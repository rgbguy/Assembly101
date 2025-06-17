.section .rodata
	msg_main_print:
	.string "%d\n"

.section .text
.globl	main
.type	main,	@function
main:
	push	%ebp
	movl	%esp,	%ebp

	addl	$4,		%esp
	movl	$10,	-4(%ebp)
	movl	-4(%ebp),	%eax
	negl	%eax

	push	%eax
	push	$msg_main_print
	call	printf
	subl	$8,		%esp


	push	$0
	call	exit
	
