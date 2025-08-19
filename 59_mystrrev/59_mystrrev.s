.section    .rodata
    msg_main_enterString:
    .string "\n\nEnter The String:\t"

    msg_main_reverseStringIs:
    .string "\n\nReverse String Is:\t"

.section    .text
.globl  main
.type   main,   @function
main:
    addl    $-16,  %esp
    pushl   %ebp
    movl    %esp,   %ebp

    subl    $20,    %esp    #string[20]
    subl    $4,     %esp    #param
    subl    $8,     %esp    #alignment

    movl    $msg_main_enterString, (%esp)
    call    printf

    leal    -20(%ebp),  %eax
    movl    %eax,   (%esp)
    call    gets

    call    Mystrrev

    movl    $msg_main_reverseStringIs, (%esp)
    call    printf

    leal    -20(%ebp),  %eax
    movl    %eax,   (%esp)
    call    puts

    pushl   $0
    call    exit

.section    .text
.globl  Mystrrev
.type   Mystrrev,   @function
Mystrrev:
    pushl   %ebp
    movl    %esp,   %ebp

    subl    $9, %esp        #space for length and n + 1 byte for temp char
    subl    $4, %esp        #params (1 only for MYstrlen)
    subl    $3, %esp        #alignment

    movl    $0, -8(%ebp)    #n = 0;

    movl    8(%ebp),    %eax
    movl    %eax,       (%esp)
    call    Mystrlen            #output in eax
    movl    %eax,   -4(%ebp)    #output moved to length

    jmp     label_while_strrev_condition

    label_while_strrev:
        movl    -4(%ebp),   %eax    #length
        subl    -8(%ebp),   %eax    #length - n
        subl    $1,         %eax    #length - n - 1
        movl    8(%ebp),    %ebx    #base address of str
        movb    (%ebx,  %eax,   1), %dl    #temp saved
        movb    %dl,   -9(%ebp)

        movl    -8(%ebp),   %ecx    #n
        movb    (%ebx,  %ecx,   1), %dl
        movb    %dl,    (%ebx,  %eax,   1)

        movb    -9(%ebp),   %dl
        movb    %dl,    (%ebx,  %ecx,   1)
        addl    $1, -8(%ebp)        #n++

    label_while_strrev_condition:
        movl    -4(%ebp),   %eax    #length
        movl    $2,         %ecx
        xor     %edx,       %edx
        divl    %ecx                #answer in eax
        cmpl    %eax,   -8(%ebp)
        jl      label_while_strrev


    movl    %ebp,   %esp
    popl    %ebp
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
