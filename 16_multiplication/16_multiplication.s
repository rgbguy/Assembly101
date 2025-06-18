.section    .rodata
    msg_main_print1:
    .string "Enter operand 1:\t"

    msg_main_print2:
    .string "Enter operand 2:\t"

    msg_main_print3:
    .string "Multiplication is = %qd\n"

    msg_main_scan:
    .string "%d"

.section    .text
.globl  main
.type   main,   @function
main:
    push    %ebp
    movl    %esp,    %ebp

    subl    $16,    %esp

    push    $msg_main_print1
    call    printf
    addl    $4,     %esp

    leal    -4(%ebp), %eax
    push    %eax
    push    $msg_main_scan
    call    scanf
    addl    $8,     %esp

    push    $msg_main_print2
    call    printf
    addl    $4,     %esp

    leal    -8(%ebp), %eax
    push    %eax
    push    $msg_main_scan
    call    scanf
    addl    $8,     %esp

    movl    -4(%ebp),   %eax
    movl    -8(%ebp),   %ecx
    mull    %ecx

    movl    %eax,   -12(%ebp)
    movl    %edx,   -16(%ebp)

    push    -16(%ebp)
    push    -12(%ebp)  #why do we need to push both?
    #push    %edx      #this works too. What's the best practice?
    #push    %eax
    push    $msg_main_print3
    call    printf

    push    $0
    call    exit
