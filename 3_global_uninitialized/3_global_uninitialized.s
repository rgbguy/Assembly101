.section	.rodata
	msg_main_print1:
	.string "%d\n"
	
	msg_main_print2:
	.string "%p\n"


.section	.bss
	.comm	g_iNo,	4,	4

.section	.text
.globl	main
.type	main,	@function
main:
	pushl	%ebp
	movl	%esp,	%ebp

	#print1
	movl	g_iNo,	%eax
	push	%eax
	push	$msg_main_print1
	call	printf
	addl	$8,	%esp

	#print2
	movl	$g_iNo,	%eax	#leal g_iNo, %eax
	push	%eax
	push	$msg_main_print2
	call	printf
	addl	$8,	%esp

	push	$0
	call	exit
