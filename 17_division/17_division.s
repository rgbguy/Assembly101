.section    .rodata
    msg_main_print1:
    .string "Enter Numerator:\t"

    msg_main_print2:
    .string "Enter Denominator:\t"

    msg_main_printQuotient:
    .string "Quotient is: %d\n"

    msg_main_printRemainder:
    .string "Remainder is: %d\n"

    msg_main_print5:
    .string "Numerator is %qd, Denominator is %d\n"

    msg_main_scan1:
    .string "%qd"

    msg_main_scan2:
    .string "%d"

.section    .text
.globl  main
.type   main,   @function
main:
    push    %ebp
    movl    %esp,   %ebp

    subl    $20,    %esp

    push    $msg_main_print1
    call    printf
    addl    $4,     %esp

    leal    -8(%ebp),   %eax
    push    %eax
    push    $msg_main_scan1
    call    scanf
    addl    $8,     %esp

    push    $msg_main_print2
    call    printf
    addl    $4,     %esp

    leal    -12(%ebp),   %eax
    push    %eax
    push    $msg_main_scan2
    call    scanf
    addl    $8,     %esp

    push    -12(%ebp)
    push    -4(%ebp)          #why do we need to push both?
    push    -8(%ebp)
    push    $msg_main_print5
    call    printf
    addl    $12,    %esp

    movl    -4(%ebp),   %edx
    movl    -8(%ebp),   %eax
    movl    -12(%ebp),  %ecx

    divl    %ecx

    movl    %eax,   -16(%ebp)
    movl    %edx,   -20(%ebp)

    push    -16(%ebp)
    push    $msg_main_printQuotient
    call    printf
    addl    $8, %esp

    push    -20(%ebp)
    push    $msg_main_printRemainder
    call    printf
    addl    $8, %esp   

    push    $0
    call    exit
