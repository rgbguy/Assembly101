.section .rodata
    msg_fun1_print1:
    .string "Enter number: "

    msg_fun1_scan:
    .string "%d"

    msg_fun1_print2:
    .string "In fun1, iNo1 is %d, iNo2 is %d\n"

    msg_fun2_print:
    .string "In static fun2\n"

.section .data
.type   iNo2,   @object
.size   iNo2,   4
.align  4
iNo2:
    .int    40

.section .bss
    .lcomm  iNo1,  4

.section .text
.globl  fun1
.type   fun1, @function
fun1:
    pushl    %ebp
    movl    %esp,   %ebp

    pushl    $msg_fun1_print1
    call    printf
    addl    $4, %esp

    pushl    $iNo1
    pushl    $msg_fun1_scan
    call    scanf
    addl    $8, %esp

    pushl    iNo2
    pushl    iNo1     
    pushl    $msg_fun1_print2
    call    printf
    addl    $12, %esp

    call    fun2

    movl    %ebp,   %esp
    pop     %ebp
    ret

.type   fun2, @function
fun2:
    pushl    %ebp
    movl    %esp,   %ebp

    pushl    $msg_fun2_print
    call    printf
    addl    $4, %esp	

    movl    %ebp,   %esp
    pop     %ebp
    ret
