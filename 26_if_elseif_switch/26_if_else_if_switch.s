.section	.rodata
	msg_main_print_title:
	.string "1.Addition\n2.Substraction\n3.Multiplication\n4.Division\n"
	
	msg_main_printf_enterChoice:
	.string "Enter your choice\n"
		
	msg_main_scan:
	.string "%d"
	
	msg_main_printf_add:
	.string "Addition\n"

	msg_main_printf_sub:
	.string "Substraction\n"
	
	msg_main_printf_mult:
	.string "Multiplication\n"
	
	msg_main_printf_div:
	.string "Division\n"
	
	msg_main_printf_invalid:
	.string "Invalid Choice\n"
	
.section	.text
.globl	main
.type	main,	@function
main:
	pushl	%ebp
	movl	%esp,		%ebp
	
	subl	$4,		%esp
	
	pushl	$msg_main_print_title
	call	printf
	addl	$4,		%esp

	pushl	$msg_main_printf_enterChoice
	call	printf
	addl	$4,		%esp
		
	leal	-4(%ebp),	%eax
	pushl	%eax
	pushl	$msg_main_scan
	call	scanf
	addl	$8,		%esp
	
	movl	$1,		%eax
	movl	-4(%ebp),	%edx
	cmpl	%eax,	%edx
	jne		label_isNOT1
	pushl	$msg_main_printf_add
	call	printf
	addl	$4,	%esp
	jmp	label_out
		
label_isNOT1:
	movl	$2,		%eax
	movl	-4(%ebp),	%edx
	cmpl	%eax,	%edx
	jne		label_isNOT2
	pushl	$msg_main_printf_sub
	call	printf
	addl	$4,	%esp
	jmp		label_out

label_isNOT2:
	movl	$3,		%eax
	movl	-4(%ebp),	%edx
	cmpl	%eax,	%edx
	jne		label_isNOT3
	pushl	$msg_main_printf_mult
	call	printf
	addl	$4,	%esp
	jmp		label_out

label_isNOT3:
	movl	$4,		%eax
	movl	-4(%ebp),	%edx
	cmpl	%eax,	%edx
	jne		label_isNOT4
	pushl	$msg_main_printf_div
	call	printf
	addl	$4,	%esp
	jmp		label_out

label_isNOT4:
	pushl	$msg_main_printf_invalid
	call	printf
	addl	$4,	%esp
	jmp	label_out
	
label_out:
	pushl	$0
	call	exit	
