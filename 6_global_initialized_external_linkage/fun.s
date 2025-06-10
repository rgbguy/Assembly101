.section .rodata
    msg_fun_print:
    .string "In fun %d\n"

.section .data
    .globl  g_iNo
    .type   g_iNo,  @object
    .size   g_iNo,  4
    .align  4
    g_iNo:
        .int    10

.section .text
.globl  fun
.type   fun,    @function
fun:
    push    %ebp
    movl    %esp,   %ebp

    push    g_iNo
    push    $msg_fun_print
    call    printf

    movl    %ebp,   %esp
    popl    %ebp
    ret

