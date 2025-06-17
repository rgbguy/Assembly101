.section    .rodata
    msg_main_print1:
    .string "iNo1 = %d\n"

    msg_main_print2:
    .string "iNo2 = %d\n"

    msg_main_print3:
    .string "iAns1 = %d\n"

    msg_main_print4:
    .string "iAns2 = %d\n"

.section    .text
.globl  main
.type   main,   @function
main:
    push    %ebp
    movl    %esp,   %ebp

    push    $10                             #iNo1
    push    $20                             #iNo2

    subl    $8,     %esp                    #space for iAns1, iAns2

    subl    $1,     -4(%ebp)                #++iNo1
    movl    -4(%ebp), %eax                  
    movl    %eax,   -12(%ebp)

    movl    -8(%ebp), %eax
    movl    %eax,   -16(%ebp)

    subl    $1,     -8(%ebp)
    
    movl    -4(%ebp),   %eax
    push    %eax
    push    $msg_main_print1
    call    printf

    movl    -8(%ebp),   %eax
    push    %eax
    push    $msg_main_print2
    call    printf

    movl    -12(%ebp),   %eax
    push    %eax
    push    $msg_main_print3
    call    printf

    movl    -16(%ebp),   %eax
    push    %eax
    push    $msg_main_print4
    call    printf

    push    $0
    call    exit
