.section    .rodata
    msg_main_printf_enterSourceString:
    .string "\n\nEnter Source String:\t"

    msg_main_printf_SourceStringIs:
    .string "\n\nSource String is:\t"

    msg_main_printf_DestinationStringIs:
    .string "\n\nDestination String is:\t"

.section    .text
.globl      main
.type       main,   @function
main:
    addl    $-16,   %esp
    pushl   %ebp
    movl    %esp,   %ebp

    subl    $40,    %esp
    subl    $8,     %esp

    movl    $msg_main_printf_enterSourceString, (%esp)
    call    printf

    leal    -20(%ebp),  %eax
    movl    %eax,   (%esp)
    call    gets

    movl    $msg_main_printf_SourceStringIs, (%esp)
    call    printf

    leal    -20(%ebp),  %eax
    movl    %eax,   (%esp)
    call    puts

    leal    -40(%ebp),  %eax    #destination
    leal    -20(%ebp),  %edx    #source
    movl    %edx,   4(%esp)
    movl    %eax,   (%esp)
    call    Mystrcpy

    movl    $msg_main_printf_DestinationStringIs, (%esp)
    call    printf

    leal    -40(%ebp),  %eax
    movl    %eax,   (%esp)
    call    puts

    pushl   $0
    call    exit

//=================================================
.section    .text
.globl  Mystrcpy
.type   Mystrcpy,   @function
Mystrcpy:
    pushl   %ebp
    movl    %esp,   %ebp

    pushl   12(%ebp)        #2nd argument (source)
    call    Mystrlen

    addl    $1, %eax        #len+1 to consider \0
    movl    %eax,   %ecx
    movl    12(%ebp),   %esi
    movl    8(%ebp),    %edi
    rep     movsb

    movl    %ebp,   %esp
    popl    %ebp
    ret

//=================================================
.section    .text
.globl  Mystrlen
.type   Mystrlen,   @function
Mystrlen:
    pushl   %ebp
    movl    %esp,   %ebp
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
    jmp     label_while_condition

label_while:
    addl    $1,     %ecx        #str++
    addl    $1,  -4(%ebp)       #length++
label_while_condition:
    movb    (%ebx,  %ecx, 1),   %al
    cmpb    $0,     %al
    jne     label_while

    movl    -4(%ebp),   %eax 

    movl    %ebp,   %esp
    popl    %ebp
    ret

    subl    $4,     %esp        #space for length
    movl    $0,  -4(%ebp)       #length = 0
    movl    8(%ebp),    %ebx    #base ptr of string. (argument of Mystrlen)
    movl    $0,     %ecx
    jmp     label_while_condition

label_while:
    addl    $1,     %ecx        #str++
    addl    $1,  -4(%ebp)       #length++
label_while_condition:
    movb    (%ebx,  %ecx, 1),   %al
    cmpb    $0,     %al
    jne     label_while

    movl    -4(%ebp),   %eax 

    movl    %ebp,   %esp
    popl    %ebp
    ret
