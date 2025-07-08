.section .rodata
	msg_main_print_enterObj1values:
	.string "Enter obj1 values, \n"
	
	msg_main_print_enterchChar:
	.string "Enter chChar\t:"
	
	msg_main_scanChar1:
	.string "%c"
	
	msg_main_print_enteriNo:
	.string "Enter iNo\t:"

	msg_main_scaniNo:
	.string "%d"
	
	msg_main_print_entershiNo:
	.string "Enter shiNo\t:"
	
	msg_main_print_enterObj2values:
	.string "Enter obj2 values, \n"
	
	msg_main_scanChar2:
	.string "%c%c"

	msg_main_print_obj1is:
	.string "obj1 is\n"
		
	msg_main_print_obj1values:
	.string "chChar = %c, iNo = %d, shiNo = %hd\n\n"
	
	msg_main_print_obj2is:
	.string "obj2 is\n"
		
	msg_main_print_obj2values:
	.string "chChar = %c, iNo = %d, shiNo = %hd\n"
	
.section .bss
.comm	obj1,	12,	4

.section .text
.globl	main
.type	main, @function
main:
	pushl	%ebp
	movl	%esp,	%ebp
	
	subl	$12,	%esp
	subl	$4,	%esp
	
	pushl	$msg_main_print_enterObj1values
	call	printf
	addl	$4,	%esp
	
	pushl	$msg_main_print_enterchChar
	call	printf
	addl	$4,	%esp
	
	leal	obj1,	%eax
	pushl	%eax
	pushl	$msg_main_scanChar1
	call	scanf
	addl	$8,	%esp
	
	pushl	$msg_main_print_enteriNo
	call	printf
	addl	$4,	%esp
	
	leal	4(obj1),	%eax
	pushl	%eax
	pushl	$msg_main_scaniNo
	call	scanf
	addl	$8,	%esp
	
	
	pushl	$0
	call	exit










