.section .rodata
    msg_main_printf:
    .string "Enter a number\n"

    msg_main_scanf:
    .string "%d"

    msg_main_printeven:
    .string "Number is even\n"

    msg_main_printodd:
    .string "Number is odd\n"

.section .text
.globl  main
.type   main,   @function
main:
    pushl   %ebp
    movl    %esp,   %ebp

    subl    $4, %esp

    pushl   $msg_main_printf
    call    printf
    addl    $4, %esp

    leal    -4(%ebp),   %eax
    pushl   %eax
    pushl   $msg_main_scanf
    call    scanf
    addl    $8, %esp

    movl    -4(%ebp),   %eax
    movl    $2, %ecx
    xorl    %edx,   %edx
    divl    %ecx
    cmpl    $0, %edx
    jne     label_odd
    pushl   $msg_main_printeven
    call    printf
    addl    $4, %esp
    jmp     label_out

label_odd:
    pushl   $msg_main_printodd
    call    printf
    addl    $4, %esp

label_out:
    pushl   $0
    call    exit
