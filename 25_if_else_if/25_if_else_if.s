.section .rodata
    msg_main_printf:
    .string "Enter a number\n"

    msg_main_scanf:
    .string "%d"

    msg_main_printlessthan:
    .string "Number is less than 2\n"

    msg_main_printgreaterthan:
    .string "Number is greater than 2\n"

    msg_main_printnumberis2:
    .string "Number is 2\n"

.section .text
.globl  main
.type   main,   @function
main:
    pushl   %ebp
    movl    %esp,   %ebp

    subl    $4, %esp

    pushl   $msg_main_printf
    call    printf
    addl    $4, %esp

    leal    -4(%ebp),   %eax
    pushl   %eax
    pushl   $msg_main_scanf
    call    scanf
    addl    $8, %esp

    movl    -4(%ebp),   %eax
    cmpl    $2, %eax
    jge     label_greaterThanEqualTo
    pushl   $msg_main_printlessthan
    call    printf
    addl    $4, %esp
    jmp     label_out

label_greaterThanEqualTo:
    je      label_isTwo
    pushl   $msg_main_printgreaterthan
    call    printf
    addl    $4, %esp
    jmp     label_out   

label_isTwo:
    pushl   $msg_main_printnumberis2
    call    printf
    addl    $4, %esp

label_out:
    pushl   $0
    call    exit
