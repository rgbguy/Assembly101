.section .rodata
    msg_one_print1:
    .string "Enter two numbers: "

    msg_one_scan:
    .string "%d %d"

    msg_one_print2:
    .string "In main, %d %d %d\n"

.section .data
.globl iNo1
.type   iNo1,   @object
.size   iNo1,   4
.align  4
iNo1:
    .int    10

.section .bss
    .comm   iNo2,  4, 4

.section .text
.globl main
.type   main,   @function
main:
    push    %ebp
    movl    %esp,   %ebp

    subl    $4, %esp
    leal    -4(%ebp),   %eax
    push    %eax

    push    $msg_one_print1
    call    printf
    addl    $4, %esp

    push    $iNo2
    push    $msg_one_scan
    call    scanf

    addl    $12,    %esp 

    push    -4(%ebp)
    push    iNo2
    push    iNo1
    push    $msg_one_print2
    call    printf
    call    fun1

    movl    %ebp,   %esp
    pop     %ebp
    
    push    $0
    call    exit
