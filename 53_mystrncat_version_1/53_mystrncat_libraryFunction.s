.section    .rodata
    msg_main_printf_EnterDestination:
    .string "\n\nEnter Destination string:\t"

    msg_main_printf_EnterSource:
    .string "\n\nEnter Source string:\t"

    msg_main_printf_Entern:
    .string "\n\nEnter Value of n:\t"

    msg_main_scan:
    .string "%d"

    msg_main_printf_Concat:
    .string "\n\nConcatenated String is:\t"

.section    .text
.globl  main
.type   main,   @function
main:
    addl    $-16,   %esp        #align to 16
    pushl   %ebp
    movl    %esp,   %ebp

    subl    $64,    %esp        #space for source[20], destination[40]
    subl    $8,     %esp        #space for max input params (8)
    subl    $8,     %esp        #padding of 8 bytes to match 80. 80/16 = 5

    movl    $msg_main_printf_EnterSource,   (%esp)
    call    printf

    leal    -60(%ebp), %eax
    movl    %eax,   (%esp)
    call    gets

    movl    $msg_main_printf_EnterDestination,   (%esp)
    call    printf

    leal    -20(%ebp), %eax
    movl    %eax,   (%esp)
    call    gets

    movl    $msg_main_printf_Entern,   (%esp)
    call    printf

    leal    -64(%ebp),  %eax
    movl    %eax,   4(%esp)
    movl    $msg_main_scan, (%esp)
    call    scanf

    leal    -20(%ebp), %eax
    movl    %eax,   4(%esp)
    leal    -60(%ebp), %eax
    movl    %eax,   (%esp)
    movl    -64(%ebp),  %eax
    movl    %eax,   8(%esp)
    call    strncat

    movl    $msg_main_printf_Concat,   (%esp)
    call    printf

    leal    -60(%ebp), %eax
    movl    %eax,   (%esp)
    call    puts

    pushl   $0
    call    exit
