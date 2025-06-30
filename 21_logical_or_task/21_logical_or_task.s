.section .rodata
    msg_main_print3No:
    .string "Enter 3 numbers\n"

    msg_main_scan:
    .string "%d %d %d"

    msg_main_printFinal:
    .string "%d %d %d %d\n"

.section .text
.globl  main
.type   main,   @function
main:
    pushl   %ebp
    movl    %esp,   %ebp

    subl    $16,    %esp

    pushl   $msg_main_print3No
    call    printf
    addl    $4, %esp

    leal    -4(%ebp),   %eax
    leal    -8(%ebp),   %edx
    leal    -12(%ebp),  %ecx
    pushl   %ecx
    pushl   %edx
    pushl   %eax
    pushl   $msg_main_scan
    call    scanf
    addl    $16,    %esp

    movl    -4(%ebp),   %eax
    cmpl    $0,     %eax
    je      label_OR
    addl    $1,     -8(%ebp)
    movl    -8(%ebp),   %eax
    cmpl    $0, %eax
    je      label_OR
    movl    $1, %eax

#at this stage, eax has answer to left operand of OR

label_OR:
    cmpl    $1, %eax
    je      label_out
    addl    $1, -12(%ebp)
    movl    -12(%ebp),  %eax
    cmpl    $0, %eax
    jne     label_set1
    movl    $0, %eax
    jmp     label_out

#at this stage, eax has answer to OR

label_set1:
    movl    $1, %eax
label_out:
    movl    %eax,   -16(%ebp)
    pushl   -16(%ebp)
    pushl   -12(%ebp)
    pushl   -8(%ebp)
    pushl   -4(%ebp)
    pushl   $msg_main_printFinal
    call    printf
    addl    $20,    %esp

    pushl   $0
    call    exit
