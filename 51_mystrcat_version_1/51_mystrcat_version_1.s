.section    .rodata
    msg_main_printf_EnterDestination:
    .string "\n\nEnter Destination string:\t"

    msg_main_printf_EnterSource:
    .string "\n\nEnter Source string:\t"

    msg_main_printf_Concat:
    .string "\n\nConcatenated String is:\t"

.section    .text
.globl  main
.type   main,   @function
main:
    addl    $-16,   %esp        #align to 16
    pushl   %ebp
    movl    %esp,   %ebp

    subl    $60,    %esp        #space for source[20], destination[40]
    subl    $8,     %esp        #space for max input params (8)
    subl    $12,    %esp        #padding of 12 bytes to match 80. 80/16 = 5

    movl    $msg_main_printf_EnterDestination,   (%esp)
    call    printf

    leal    -60(%ebp), %eax
    movl    %eax,   (%esp)
    call    gets

    movl    $msg_main_printf_EnterSource,   (%esp)
    call    printf

    leal    -20(%ebp), %eax
    movl    %eax,   (%esp)
    call    gets

    leal    -60(%ebp), %eax
    movl    %eax,   (%esp)
    leal    -20(%ebp), %eax
    movl    %eax,   4(%esp)
    call    MYstrcat

    movl    $msg_main_printf_Concat,   (%esp)
    call    printf

    leal    -60(%ebp), %eax
    movl    %eax,   (%esp)
    call    puts

    pushl   $0
    call    exit


.section    .text
.globl  MYstrcat
.type   MYstrcat,   @function
MYstrcat:
    pushl   %ebp
    movl    %esp,   %ebp

    #8(%ebp) has destination base address
    #12(%ebp) has source base address

    movl    8(%ebp),    %ebx
    movl    $0,         %ecx
    jmp     label_while_condition

    label_while:
        addl    $1,     %ecx

    label_while_condition:
        movb    (%ebx,  %ecx,  1), %al
        cmpb    $0, %al
        jne     label_while

    leal    (%ebx,  %ecx,  1),  %edi
    movl    12(%ebp),           %esi

    movl    12(%ebp),    %ebx
    movl    $0,         %ecx
    jmp     label_while2_condition

    label_while2:
        movsb

    label_while2_condition:
        movb    (%ebx,  %ecx,  1), %al
        cmpb    $0, %al
        jne     label_while2

    movl    %ebp,   %esp
    pop     %ebp
    ret
