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

    subl    $4, %esp    #param for strlen
    subl    $12,%esp    #alignment

    #8(%ebp) => string 1 base
    #12(%ebp)=> string 2 base
    movl    8(%ebp),    %esi    #string 1 in esi
    movl    12(%ebp),   %edi    #string 2 in edi
    
    movl    %esi,   (%esp)
    call    Mystrlen
    movl    %eax,   %edx
    movl    %edi,   (%esp)
    call    Mystrlen
    cmpl    %eax,   %edx    #(edx has string1 len. eax has string2 len)(str1 _ str2)

    jle     label_str1_is_less
    addl    $1,     %eax
    movl    %eax,   %ecx    #counter
    jmp     label_compare

label_str1_is_less:
    addl    $1,     %edx
    movl    %edx,   %ecx    #counter

label_compare:
    repe    cmpsb
    je      label_while_out_return0
    movl    $1, %eax
    jmp     label_while_out

label_while_out_return0:
    movl    $0, %eax

label_while_out:
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
