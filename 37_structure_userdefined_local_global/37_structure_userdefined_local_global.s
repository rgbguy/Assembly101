.section .rodata
	msg_main_print_enterObj1values:
	.string "Enter obj1 values, \n"
	
	msg_main_print_enterchChar:
	.string "Enter chChar\t:"
	
	msg_main_scanChar1:
	.string "%c"
	
	msg_main_print_enteriNo:
	.string "Enter iNo\t:"

	msg_main_scaniNo1:
	.string "%d"
	
	msg_main_scanshiNo:
	.string "%hd"
	
	msg_main_print_entershiNo:
	.string "Enter shiNo\t:"
	
	msg_main_print_enterObj2values:
	.string "Enter obj2 values, \n"
	
	msg_main_scanChar2:
	.string "%c%c"

	msg_main_scaniNo2:
	.string "%c%d"

	msg_main_scanshiNo2:
	.string "%c%hd"

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
	
	subl	$12,	%esp            #space for obj2
	subl	$1,	    %esp            #t  
#-------------------OBJ1 Scan Start------------------------
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
	
	leal	obj1,	%eax
	leal	4(%eax),    %eax
    pushl   %eax
	pushl	$msg_main_scaniNo1
	call	scanf
	addl	$8,	%esp

	pushl	$msg_main_print_entershiNo
	call	printf
	addl	$4,	%esp
	
	leal	obj1,	%eax
	leal	8(%eax),    %eax
    pushl   %eax
	pushl	$msg_main_scanshiNo
	call	scanf
	addl	$8,	%esp
#-------------------OBJ1 Scan End------------------------

#-------------------OBJ2 Scan Start------------------------
	pushl	$msg_main_print_enterObj2values
	call	printf
	addl	$4,	%esp
	
	pushl	$msg_main_print_enterchChar
	call	printf
	addl	$4,	%esp
	
	leal	-12(%ebp),	%eax
	pushl	%eax
	leal	-13(%ebp),	%eax
	pushl	%eax
	pushl	$msg_main_scanChar2
	call	scanf
	addl	$12,	%esp
	
	pushl	$msg_main_print_enteriNo
	call	printf
	addl	$4,	%esp
	
	leal	-8(%ebp),	%eax
    pushl   %eax
	leal	-13(%ebp),	%eax
	pushl	%eax
	pushl	$msg_main_scaniNo2
	call	scanf
	addl	$12,	%esp

	pushl	$msg_main_print_entershiNo
	call	printf
	addl	$4,	%esp
	
	leal	-4(%ebp),	%eax
    pushl   %eax
	leal	-13(%ebp),	%eax
	pushl	%eax
	pushl	$msg_main_scanshiNo2
	call	scanf
	addl	$12,	%esp
#-------------------OBJ2 Scan End------------------------

#-------------------OBJ1 Print------------------------

	pushl	$msg_main_print_obj1is
	call	printf
	addl	$4,	%esp

	leal	obj1,	%ebx
    xorl    %eax,   %eax
    movb    (%ebx), %al
    movl    4(%ebx), %edx
    movw    8(%ebx), %cx
    pushl   %ecx
    pushl   %edx
    pushl   %eax
    pushl   $msg_main_print_obj1values
    call    printf
    addl    $16,    %esp

#-------------------OBJ2 Print------------------------

	pushl	$msg_main_print_obj2is
	call	printf
	addl	$4,	%esp

	leal	-12(%ebp),	%ebx
    xorl    %eax,   %eax
    movb    (%ebx), %al
    movl    4(%ebx), %edx
    movw    8(%ebx), %cx
    pushl   %ecx
    pushl   %edx
    pushl   %eax
    pushl   $msg_main_print_obj2values
    call    printf
    addl    $16,    %esp

	pushl	$0
	call	exit










