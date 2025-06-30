.section .rodata
    msg_main_printEnter2No:
    .string "Enter 2 numbers\n"

    msg_main_scan:
    .string "%d %d"

    msg_main_printNOT1:
    .string "~iNo1: %d\n"

    msg_main_printNOT2:
    .string "~iNo2: %d\n"

    msg_main_printAND:
    .string "AND: %d\n"

    msg_main_printOR:
    .string "OR: %d\n"

    msg_main_printXOR:
    .string "XOR: %d\n"

    msg_main_printLeftShitiNo1:
    .string "LeftShift iNo1: %d\n"

    msg_main_printRightShitiNo2:
    .string "RightShift iNo2: %d\n"

.section .text
.globl  main
.type   main,   @function
main:
    pushl   %ebp
    movl    %esp,   %ebp

    subl    $8, %esp

    pushl   $msg_main_printEnter2No
    call    printf
    addl    $4, %esp

    leal    -4(%ebp),   %eax
    leal    -8(%ebp),   %edx
    pushl   %edx
    pushl   %eax
    pushl   $msg_main_scan
    call    scanf
    addl    $12,    %esp

    movl   -4(%ebp),   %eax
    notl    %eax
    pushl   %eax
    pushl   $msg_main_printNOT1
    call    printf
    addl    $8, %esp

    movl   -8(%ebp),   %eax
    notl    %eax
    pushl   %eax
    pushl   $msg_main_printNOT2
    call    printf
    addl    $8, %esp

    movl   -4(%ebp),   %eax
    movl   -8(%ebp),   %edx
    andl    %eax,   %edx
    pushl   %edx
    pushl   $msg_main_printAND
    call    printf
    addl    $8, %esp

    movl   -4(%ebp),   %eax
    movl   -8(%ebp),   %edx
    orl    %eax,   %edx
    pushl   %edx
    pushl   $msg_main_printOR
    call    printf
    addl    $8, %esp

    movl   -4(%ebp),   %eax
    movl   -8(%ebp),   %edx
    xorl    %eax,   %edx
    pushl   %edx
    pushl   $msg_main_printXOR
    call    printf
    addl    $8, %esp

    movl   -4(%ebp),   %eax
    sall    $1, %eax
    pushl   %eax
    pushl   $msg_main_printLeftShitiNo1
    call    printf
    addl    $8, %esp

    movl   -8(%ebp),   %eax
    sarl    $1, %eax
    pushl   %eax
    pushl   $msg_main_printRightShitiNo2
    call    printf
    addl    $8, %esp

    pushl   $0
    call    exit

