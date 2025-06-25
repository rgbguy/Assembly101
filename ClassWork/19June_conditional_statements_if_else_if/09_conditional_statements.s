.section .rodata
	msg_main_print0:
	.string "Enter a number\t";
	
	msg_main_scan:
	.string "%d"
	
	msg_main_print1:
	.string "Number is less than 2\n";
	
	msg_main_print2:
	.string "Number is greater than 2\n";
	
	msg_main_print3:
	.string "Number is 2\n";
	
.section .text
.globl	main
.type	main,	@function
	main:
		push	%ebp
		movl	%esp,	%ebp
		
		subl	$4,	%esp
		
		push	$msg_main_print0
		call	printf
		addl	$4,	%esp
		
		leal	-4(%ebp),	%eax
		push	%eax
		push	$msg_main_scan
		call	scanf
		addl	$8,	%esp
		
		movl	-4(%ebp),	%eax
		movl	$2,	%edx
		cmpl	%edx,	%eax
		je	label_equal_to
		jle	label_lessthan
		jge	label_greaterthan
		
	label_lessthan:
		push	$msg_main_print1
		call	printf
		addl	$4,	%esp
		jmp	label_out

	label_greaterthan:
		push	$msg_main_print2
		call	printf
		addl	$4,	%esp	
		jmp	label_out
		
	label_equal_to:
		push	$msg_main_print3
		call	printf
		addl	$4,	%esp
		jmp	label_out
		
	label_out:
		push	$0
		call	exit

