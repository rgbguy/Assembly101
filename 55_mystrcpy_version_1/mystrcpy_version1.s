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

    subl    $4, %esp        #counter
    movl    $0, -4(%ebp)    #counter = 0

    #12 src
    #8 dest
    movl    12(%ebp),   %esi    #source base address
    movl    8(%ebp),    %edi    #destination base address

label_while:
    movsb
    movl    -4(%ebp),   %ecx
    movb    (%esi,  %ecx,   1), %al
    cmpb    $0, %al
    jne     label_while

    movl    $0, (%edi,  %ecx,   1)

    movl    %ebp,   %esp
    popl    %ebp
    ret

//=================================================
