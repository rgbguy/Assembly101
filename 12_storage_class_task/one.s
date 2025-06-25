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
    pushl    %ebp
    movl    %esp,   %ebp

    subl    $4, %esp

    push    $msg_one_print1
    call    printf
    addl    $4, %esp

    leal    -4(%ebp),   %eax
    pushl    %eax
    pushl    $iNo2
    pushl    $msg_one_scan
    call    scanf
    addl    $12,    %esp 

    pushl    -4(%ebp)
    pushl    iNo2
    pushl    iNo1
    pushl    $msg_one_print2
    call    printf
    addl    $16,    %esp
   
    call    fun1
    
    movl    %ebp,   %esp
    pop     %ebp
    
    pushl    $0
    call    exit
