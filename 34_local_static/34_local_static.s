.section .rodata
    msg_fun_print:
    .string "In fun %d\n"

.section .data
    .type   iNo,    @object
    .size   iNo,    4
    .align  4
    iNo:
        .int    10

.section .text
.globl  main
.type   main,   @function
main:
    pushl   %ebp
    movl    %esp,   %ebp

    subl    $4, %esp

    movl    $0, -4(%ebp)

label_for_condition:
    movl    -4(%ebp),   %eax
    cmpl    $5, %eax
    jge     label_out
    call    fun
    addl    $1, -4(%ebp)
    jmp     label_for_condition

label_out:
    pushl   $0
    call    exit

.section .text
.globl  fun
.type   fun,   @function
fun:
    pushl   %ebp
    movl    %esp,   %ebp

    pushl   iNo
    pushl   $msg_fun_print
    call    printf
    addl    $8, %esp

    addl    $1, iNo

    pop     %ebp
    ret
