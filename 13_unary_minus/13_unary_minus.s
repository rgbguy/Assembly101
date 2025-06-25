.section .rodata
	msg_main_print:
	.string "%d\n"

.section .text
.globl	main
.type	main,	@function
main:
	push	%ebp
	movl	%esp,	%ebp

	push	$10

	push	$-100
	push	$msg_main_print
	call	printf
	addl	$8,		%esp

	push	-4(%ebp)
	push	$msg_main_print
	call	printf
	addl	$8,		%esp	

	movl	-4(%ebp),	%eax
	negl	%eax
	push	%eax
	push	$msg_main_print
	call	printf
	addl	$8,		%esp

	push	-4(%ebp)
	push	$msg_main_print
	call	printf
	addl	$8,		%esp	
	
	push	$0
	call	exit
	
