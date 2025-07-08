.section .rodata
    msg_main_print_enter2No:
    .string "Enter 2 no:\t"

    msg_main_scan:
    .string "%d %d"

    msg_main_print_sum:
    .string "Sum is %d\n"

    msg_main_print_diff:
    .string "Diff is %d\n" 

.section    .text
.globl  main
.type   main,   @function
main:
    pushl   %ebp
    movl    %esp,   %ebp

    subl    $16,    %esp

    pushl   $msg_main_print_enter2No
    call    printf
    addl    $4, %esp

    leal    -4(%ebp),   %eax
    leal    -8(%ebp),   %edx
    pushl   %edx
    pushl   %eax
    pushl   $msg_main_scan
    call    scanf
    addl    $12,    %esp

    leal    -12(%ebp),   %eax
    leal    -16(%ebp),   %edx
    pushl   %edx
    pushl   %eax
    pushl   -8(%ebp)
    pushl   -4(%ebp)
    call    SumDiff
    addl    $16,    %esp

    pushl   -12(%ebp)
    pushl   $msg_main_print_sum
    call    printf

    pushl   -16(%ebp)
    pushl   $msg_main_print_diff
    call    printf

    pushl   $0
    call    exit

.section    .text
.globl  SumDiff
.type   SumDiff,    @function
SumDiff:
    pushl   %ebp
    movl    %esp,   %ebp

    movl    8(%ebp),   %eax         #iNo1 (first param)
    movl    12(%ebp),   %edx        #iNo2
    addl    %edx,   %eax
    movl    16(%ebp),   %ebx
    movl    %eax,   (%ebx)

    movl    8(%ebp),   %eax         #iNo1 (first param)
    subl    %edx,   %eax
    movl    20(%ebp),   %ebx
    movl    %eax,   (%ebx)

    movl    %ebp,   %esp
    popl    %ebp
    ret
