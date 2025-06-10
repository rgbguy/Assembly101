.section    .rodata
    msg_main_print:
        .string "In main giNo = %d, &giNo = %d\n"

.section .bss
    .comm   g_iNo,  4,  4

.section    .text
.globl  main
.type   main,   @function
main:
    push    %ebp
    movl    %esp,   %ebp

    push    $g_iNo
    push    g_iNo
    push    $msg_main_print
    call    printf
    addl    $12, %esp

    call fun
    
    pushl   $0
    call    exit

    