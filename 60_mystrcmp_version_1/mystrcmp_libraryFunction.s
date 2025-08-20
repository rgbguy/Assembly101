.section    .rodata
    msg_main_enterString1:
    .string "\n\nEnter String1:\t"

    msg_main_enterString2:
    .string "\n\nEnter String2:\t"

    msg_main_same:
    .string "\n\nBoth Strings Are Same\n"

    msg_main_diff:
    .string "\n\nBoth Strings Are Diffrent\n"

.section     .text
.globl  main
.type   main,   @function
main:
    addl    $-16,   %esp
    pushl   %ebp
    movl    %esp,   %ebp

    subl    $44,    %esp
    subl    $8,     %esp    #2 params
    subl    $12,    %esp    #alignment

    movl    $msg_main_enterString1, (%esp)
    call    printf

    leal    -20(%ebp),  %eax
    movl    %eax,   (%esp)
    call    gets

    movl    $msg_main_enterString2, (%esp)
    call    printf

    leal    -40(%ebp),  %eax
    movl    %eax,   (%esp)
    call    gets

    leal    -20(%ebp),  %eax    #string 1 base address
    leal    -40(%ebp),  %edx    #string 2 base address
    movl    %edx,       4(%esp)
    movl    %eax,       (%esp)
    call    strcmp
    movl    %eax,   -44(%ebp)   #strcmp output stored in ch

    cmpl    $0,     %eax
    jne     label_not_equal

    movl    $msg_main_same, (%esp)
    call    printf
    jmp     label_out

label_not_equal:
    movl    $msg_main_diff, (%esp)
    call    printf

label_out:
    pushl   $0
    call    exit

