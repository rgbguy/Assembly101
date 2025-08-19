.section    .rodata
    msg_main_printf_EnterDestination:
    .string "\n\nUsing REP\nEnter Destination string:\t"

    msg_main_printf_EnterSource:
    .string "\n\nEnter Source string:\t"

    msg_main_printf_Concat:
    .string "\n\nConcatenated String is1:\t"

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

    subl    $4, %esp    #1 param space for MYstrlen

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

    movl    %esi,   (%esp)
    call    Mystrlen

    movl    %eax,   %ecx

    rep     movsb

    movl    %ebp,   %esp
    pop     %ebp
    ret

.section    .text
.globl  Mystrlen
.type   Mystrlen,   @function
Mystrlen:
    pushl   %ebp
    movl    %esp,   %ebp

    subl    $4,     %esp        #space for length
    movl    $0,  -4(%ebp)       #length = 0
    movl    8(%ebp),    %ebx    #base ptr of string. (argument of Mystrlen)
    movl    $0,     %ecx
    jmp     label_while_strlen_condition

label_while_strlen:
    addl    $1,     %ecx        #str++
    addl    $1,  -4(%ebp)       #length++
label_while_strlen_condition:
    movb    (%ebx,  %ecx, 1),   %al
    cmpb    $0,     %al
    jne     label_while_strlen

    movl    -4(%ebp),   %eax 

    movl    %ebp,   %esp
    popl    %ebp
    ret
    