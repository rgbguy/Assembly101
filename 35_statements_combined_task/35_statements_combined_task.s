.section .rodata
    msg_main_print_alloptions:
    .string "\n1.Addition\n2.Subtraction\n3.Multiplication\n4.Division\n5.Exit\n"

    msg_main_print_enterchoice:
    .string "Enter your choice:\t"

    msg_main_scan_choice:
    .string "%d"

    msg_main_print_enterTwoNums:
    .string "Enter two numbers:\t"

    msg_main_scan_TwoNums:
    .string "%d %d"

    msg_main_print_enterValidChoice:
    .string "Enter valid choice\n"

    msg_main_print_ans:
    .string "Answer is %d\n\n"

    msg_main_print_more_choices:
    .string "Do you want to enter more choices? (1/0):\t"

.section .text
.globl  main
.type   main,   @function
main:
    pushl   %ebp
    movl    %esp,   %ebp

    subl    $16,    %esp

label_do:
    pushl   $msg_main_print_alloptions
    call    printf
    addl    $4, %esp

    pushl   $msg_main_print_enterchoice
    call    printf
    addl    $4, %esp

    leal    -16(%ebp),  %eax
    pushl   %eax
    pushl   $msg_main_scan_choice
    call    scanf
    addl    $8, %esp

    movl   -16(%ebp),  %eax
    movl   $0, %edx
    cmpl    %edx,   %eax
    jle     label_outOfIf
    movl   $5, %edx
    cmpl    %edx,   %eax
    jge     label_outOfIf

    pushl   $msg_main_print_enterTwoNums
    call    printf
    addl    $4, %esp

    leal    -4(%ebp),   %eax
    leal    -8(%ebp),   %edx
    pushl   %edx
    pushl   %eax
    pushl   $msg_main_scan_TwoNums
    call    scanf
    addl    $12,    %esp

label_outOfIf:
    movl   -16(%ebp),  %eax
    cmpl    $1,   %eax
    je      label_case_1

    cmpl    $2,   %eax
    je      label_case_2

    cmpl    $3,   %eax
    je      label_case_3

    cmpl    $4,   %eax
    je      label_case_4

    cmpl    $5,   %eax
    je      label_out

    pushl   $msg_main_print_enterValidChoice
    call    printf
    addl    $4, %esp

    movl    $1, -16(%ebp)
    jmp     label_do

label_case_1:
    pushl   -8(%ebp)
    pushl   -4(%ebp)
    call    Addition
    addl    $8, %esp
    movl    %eax,   -12(%ebp)
    jmp     label_printAns

label_case_2:
    pushl   -8(%ebp)
    pushl   -4(%ebp)
    call    Subtraction
    addl    $8, %esp
    movl    %eax,   -12(%ebp)
    jmp     label_printAns

label_case_3:
    pushl   -8(%ebp)
    pushl   -4(%ebp)
    call    Multiplication
    addl    $8, %esp
    movl    %eax,   -12(%ebp)
    jmp     label_printAns

label_case_4:
    pushl   -8(%ebp)
    pushl   -4(%ebp)
    call    Division
    addl    $8, %esp
    movl    %eax,   -12(%ebp)
    jmp     label_printAns

label_printAns:
    pushl   %eax
    pushl   $msg_main_print_ans
    call    printf
    addl    $8, %esp
    
    pushl   $msg_main_print_more_choices
    call    printf
    addl    $4, %esp

    leal    -16(%ebp), %edx
    pushl   %edx
    pushl   $msg_main_scan_choice
    call    scanf
    addl    $8, %esp

    movl    -16(%ebp),  %edx
    movl    $1, %ecx
    cmpl    %ecx,   %edx
    je      label_do

label_out:
    pushl   $0
    call    exit

.section .text
.globl  Addition
.type   Addition,   @function
Addition:
    pushl   %ebp
    movl    %esp,   %ebp

    movl    8(%ebp), %eax
    movl    12(%ebp),   %edx
    addl    %edx,   %eax

    pop     %ebp
    ret

.section .text
.globl  Subtraction
.type   Subtraction,   @function
Subtraction:
    pushl   %ebp
    movl    %esp,   %ebp

    movl    8(%ebp), %eax
    movl    12(%ebp),   %edx
    subl    %edx,   %eax

    pop     %ebp
    ret

.section .text
.globl  Multiplication
.type   Multiplication,   @function
Multiplication:
    pushl   %ebp
    movl    %esp,   %ebp

    movl    8(%ebp), %eax
    movl    12(%ebp),   %ecx
    mull    %ecx

    pop     %ebp
    ret

.section .text
.globl  Division
.type   Division,   @function
Division:
    pushl   %ebp
    movl    %esp,   %ebp

    movl    8(%ebp), %eax
    movl    12(%ebp),   %ecx
    xorl    %edx,   %edx
    divl    %ecx

    pop     %ebp
    ret
