.section    .rodata
    msg_main_printf:
    .string "%f\n"

    f_43.65:
    .float  43.65

    i_22:
    .int    22

    f_76.34:
    .float  76.34

    f_3.1:
    .float  3.1

    f_12.43:
    .float  12.43

    i_6:
    .int    6

    f_140.2:
    .float  140.2

    f_94.21:
    .float  94.21

.section .bss
.comm  fAns, 4,  4

.section    .text
.globl  main
.type   main,   @function
main:
    addl    $-16,   %esp
    pushl   %ebp
    movl    %esp,   %ebp

    subl    $16,    %esp

    fild    i_22                 
    flds    f_43.65               
    fdivp    %st(0), %st(1)

    flds    f_76.34             
    flds    f_3.1              
    fmulp    %st(0), %st(1)

    faddp   %st(0), %st(1)

    fild    i_6                
    flds    f_12.43              
    fmulp    %st(0), %st(1)

    flds    f_94.21             
    flds    f_140.2          
    fdivp    %st(0), %st(1)

    fsubrp   %st(0), %st(1)

    fdivrp   %st(0), %st(1)

    fstpl   4(%esp)
    movl    $msg_main_printf,   (%esp)
    call    printf

    pushl   $0
    call    exit
