.section    .rodata
    msg_main_printf_enterString:
    .string "\n\nEnter The String::\t"

    msg_main_printf_StringInUpperCaseIs:
    .string "\nString In Upper Case Is:\t"


.section    .text
.globl      main
.type       main,   @function
main:
    addl    $-16,   %esp
    pushl   %ebp
    movl    %esp,   %ebp

    subl    $20,    %esp    #20
    subl    $4,     %esp    #params
    subl    $8,     %esp    #alignment

    movl    $msg_main_printf_enterString, (%esp)
    call    printf
    leal    -20(%ebp),  %eax
    movl    %eax,   (%esp)
    call    gets

    leal    -20(%ebp),  %eax    #string
    movl    %eax,   (%esp)
    call    Mystrupr

    movl    $msg_main_printf_StringInUpperCaseIs, (%esp)
    call    printf
    leal    -20(%ebp),  %eax
    movl    %eax,   (%esp)
    call    puts

    pushl   $0
    call    exit

//=================================================
.section    .text
.globl  Mystrupr
.type   Mystrupr,   @function
Mystrupr:
    pushl   %ebp
    movl    %esp,   %ebp

    #8(%ebp) has str

    subl    $4, %esp        #counter
    movl    $0, -4(%ebp)    #counter = 0

    movl    8(%ebp),    %ebx    #base address of str
    movl    -4(%ebp),   %ecx    #index
    jmp     label_while_condition

    label_while:
        subl    $32,    (%ebx, %ecx, 1)
        addl    $1, %ecx

    label_while_condition:
        movb    (%ebx, %ecx, 1),    %dl
        cmpb    $0, %dl
        jne     label_while

    movl    %ebp,   %esp
    popl    %ebp
    ret

//=================================================
