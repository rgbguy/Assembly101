.section .rodata
    msg_fun_print:
    .string "In fun giNo = %d, &giNo = %d\n"

.section .bss
    .comm   g_iNo,  4,  4

.section .text
.globl  fun
.type   fun,    @function
fun:
    push    %ebp
    movl    %esp,   %ebp

    push    $g_iNo
    push    g_iNo
    push    $msg_fun_print
    call    printf

    movl    %ebp,   %esp
    popl    %ebp
    ret

