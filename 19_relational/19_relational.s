.section .rodata
    msg_main_print_enterNo:
    .string "Enter 3 numbers\n"

    msg_main_scan:
    .string "%d %d %d"

    msg_main_print_ans:
    .string "%d\n"

.section .text
.globl  main
.type   main,   @function
main:
    pushl   %ebp
    movl    %esp,   %ebp

    subl    $16,    %esp

    pushl   $msg_main_print_enterNo
    call    printf
    addl    $4,     %esp

    leal    -4(%ebp),   %eax
    leal    -8(%ebp),   %edx
    leal    -12(%ebp),  %ecx
    pushl   %ecx
    pushl   %edx
    pushl   %eax
    pushl   $msg_main_scan
    call    scanf
    addl    $16,    %esp

    movl    -4(%ebp),   %edx
    movl    -8(%ebp),   %eax
    cmpl    %eax,   %edx
    jl      label_less_than_true
    movl    $0, %eax
    jmp     label_not_equal

label_less_than_true:
    movl    $1, %eax
    jmp     label_not_equal

label_not_equal:
    movl    -12(%ebp),  %edx
    cmpl    %edx,   %eax
    jne     label_not_equal_true
    movl    $0, -16(%ebp)
    jmp     label_out

label_not_equal_true:
    movl    $1, -16(%ebp)
    jmp     label_out

label_out:
    pushl   -16(%ebp)
    pushl   $msg_main_print_ans
    call    printf
    addl    $8, %esp

    pushl   $0
    call    exit
