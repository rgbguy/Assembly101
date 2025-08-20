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
    call    MYstrcmp
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

.section     .text
.globl  MYstrcmp
.type   MYstrcmp,   @function
MYstrcmp:
    pushl   %ebp
    movl    %esp,   %ebp

    #8(%ebp) => string 1 base
    #12(%ebp)=> string 2 base

    movl    8(%ebp),    %esi    #string 1 in esi
    movl    12(%ebp),   %edi    #string 2 in edi
    jmp     label_while_mystrcmp_condition

label_while_mystrcmp:
    cmpsb
    jne     label_mystrcmp_stringsunequal

label_while_mystrcmp_condition:
    xorl    %eax,   %eax
    movb    (%esi), %al

    xorl    %edx,   %edx
    movb    (%edi), %dl

    cmpb    $0,     %al
    jne     label_while_mystrcmp
    cmpb    $0,     %dl
    jne     label_while_mystrcmp
    jmp     label_while_out_return0

label_mystrcmp_stringsunequal:
    subb    %dl,    %al
    jmp     label_while_out

label_while_out_return0:
    movl    $0, %eax

label_while_out:
    movl    %ebp,   %esp
    pop     %ebp
    ret
