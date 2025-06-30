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

    movl    -4(%ebp),   %eax
    cmpl    $0,         %eax
    je      label_2nd_and
    addl    $1,     -8(%ebp)
    movl    -8(%ebp),   %eax
    cmpl    $0,     %eax
    je      label_2nd_and       #this means eax has 0
    movl    $1,     %eax

label_2nd_and:
    cmpl    $0,     %eax
    je      label_result       #this means eax has 0
    addl    $1,     -12(%ebp)
    movl    -12(%ebp),  %eax
    cmpl    $0,     %eax
    je      label_result
    movl    $1,     %eax    

label_result:
    movl    %eax,   -16(%ebp)
    pushl   -12(%ebp)
    pushl   -8(%ebp)
    pushl   -4(%ebp)
    pushl   $msg_main_printFinal
    call    printf
    addl    $16, %esp

    pushl   $0
    call    exit
