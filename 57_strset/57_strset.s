.section    .rodata
    msg_main_printf_enterString:
    .string "\n\nEnter The String::\t"

    msg_main_printf_EnterCharacterToSet:
    .string "\n\nEnter The Character To Set:\t"

    msg_main_scanf:
    .string " %c"

    msg_main_printf_NowStringIs:
    .string "\n\nNow String Is:\t"

.section    .text
.globl      main
.type       main,   @function
main:
    addl    $-16,   %esp
    pushl   %ebp
    movl    %esp,   %ebp

    subl    $21,    %esp    #20+1
    subl    $8,     %esp    #params
    subl    $3,     %esp    #alignment

    movl    $msg_main_printf_enterString, (%esp)
    call    printf
    leal    -20(%ebp),  %eax
    movl    %eax,   (%esp)
    call    gets

    movl    $msg_main_printf_EnterCharacterToSet, (%esp)
    call    printf
    leal    -21(%ebp),  %eax
    movl    %eax,   4(%esp)
    movl    $msg_main_scanf, (%esp)
    call    scanf

    movb    -21(%ebp),  %al
    movb    %al,    4(%esp)
    leal    -20(%ebp),  %eax    #string
    movl    %eax,   (%esp)
    call    Mystrset

    movl    $msg_main_printf_NowStringIs, (%esp)
    call    printf

    leal    -20(%ebp),  %eax
    movl    %eax,   (%esp)
    call    puts

    pushl   $0
    call    exit

//=================================================
.section    .text
.globl  Mystrset
.type   Mystrset,   @function
Mystrset:
    pushl   %ebp
    movl    %esp,   %ebp

    #8(%ebp) has str
    #12(%ebp) has ch

    subl    $4, %esp        #counter
    movl    $0, -4(%ebp)    #counter = 0

    movl    8(%ebp),    %ebx    #base address of str
    movl    -4(%ebp),   %ecx    #index
    jmp     label_while_condition

    label_while:
        movb    12(%ebp),    %dh
        movb    %dh,    (%ebx, %ecx, 1)
        addl    $1, %ecx

    label_while_condition:
        movb    (%ebx, %ecx, 1),    %dl
        cmpb    $0, %dl
        jne     label_while

    movl    %ebp,   %esp
    popl    %ebp
    ret

//=================================================
