.section    .rodata
    msg_main_print:
        .string "In main %d\n"

.section .data
    .globl  g_iNo
    .type   g_iNo,  @object
    .size   g_iNo,  4
    .align  4
    g_iNo:
        .int    20
 
.section    .text
.globl  main
.type   main,   @function
main:
    push    %ebp
    movl    %esp,   %ebp

    movl    g_iNo,  %eax
    push    %eax
    push    $msg_main_print
    call    printf
    addl    $8, %esp

    call fun
    
    pushl   $0
    call    exit

    