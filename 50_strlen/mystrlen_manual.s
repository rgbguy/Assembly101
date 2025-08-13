.section    .rodata
    msg_main_print_lenHello:
    .string "\nThe length of Hello Is %d\n"

    msg_main_print_lenGood:
    .string "The length of good is %d\n"

    msg_main_print_lenMorning:
    .string "The length of Morning is %d\n"

    msg_main_Morning:
    .string "Morning"

    msg_main_Debug:
    .string "Printing string: %s\n"

.section    .text
.globl  main
.type   main,   @function
main:
    addl    $-16,    %esp    #align esp to 16
    pushl   %ebp
    movl    %esp,   %ebp

    subl    $9,    %esp     #space for ptr (4 bytes) and str[5] (5 bytes)
    subl    $8,     %esp    #space for maximum params (2*4bytes)
    subl    $15,    %esp    #alignment

    movl    $6, (%esp)      #param of malloc space for "Hello\0"
    call    malloc          #memory address stored in eax
    movl    %eax,   -4(%ebp)
    movl    $0, %ecx
    movb    $'H', (%eax, %ecx, 1)
    movl    $1, %ecx
    movb    $'e', (%eax, %ecx, 1)
    movl    $2, %ecx
    movb    $'l', (%eax, %ecx, 1)
    movl    $3, %ecx
    movb    $'l', (%eax, %ecx, 1)
    movl    $4, %ecx
    movb    $'o', (%eax, %ecx, 1)
    movl    $5, %ecx
    movb    $0, (%eax, %ecx, 1)

    movb    $'G',  -9(%ebp)
    movb    $'o',  -8(%ebp)
    movb    $'o',  -7(%ebp)
    movb    $'d',  -6(%ebp)
    movb    $0,  -5(%ebp)

    pushl   -4(%ebp)
    pushl   $msg_main_Debug
    call    printf

    leal    -9(%ebp), %eax
    pushl   %eax
    pushl   $msg_main_Debug
    call    printf

    movl    -4(%ebp),   %eax
    movl    %eax,  (%esp)
    call    Mystrlen

    movl    %eax,   4(%esp)
    movl    $msg_main_print_lenHello, (%esp)
    call    printf

    leal    -9(%ebp),   %eax
    movl    %eax,  (%esp)
    call    Mystrlen

    movl    %eax,   4(%esp)
    movl    $msg_main_print_lenGood, (%esp)
    call    printf

    movl    $msg_main_Morning,  (%esp)
    call    Mystrlen

    movl    %eax,   4(%esp)
    movl    $msg_main_print_lenMorning, (%esp)
    call    printf
    
    pushl   $0
    call    exit

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
