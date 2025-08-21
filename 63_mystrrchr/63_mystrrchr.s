.section    .rodata
    msg_main_enter_string:
    .string "\n\nEnter The String:\t"

    msg_main_enter_char:
    .string "\n\nEnter Character To Be Found:\t"

    msg_main_scan:
    .string "%c"

    msg_main_not_found:
    .string "\n\nCharacter Is Not Found\n"

    msg_main_found:
    .string "\n\nCharacter Is Found At %d Location\n"

.section     .text
.globl  main
.type   main,   @function
main:
    addl    $-16,   %esp
    pushl   %ebp
    movl    %esp,   %ebp

    subl    $25,    %esp
    subl    $8,     %esp    #2 params
    subl    $15,    %esp    #alignment

    movl    $msg_main_enter_string, (%esp)
    call    printf

    leal    -20(%ebp),  %eax
    movl    %eax,   (%esp)
    call    gets

    movl    $msg_main_enter_char, (%esp)
    call    printf

    leal    -21(%ebp),  %eax
    movl    %eax,   4(%esp)
    movl    $msg_main_scan, (%esp)
    call    scanf

    leal    -20(%ebp),  %eax    #string 1 base address
    xorl    %edx,   %edx
    movb    -21(%ebp),  %dl     #string 2 base address
    movb    %dl,       4(%esp)
    movl    %eax,       (%esp)
    call    MYstrchr
    movl    %eax,   -25(%ebp)   #strchr output stored in ptr

    cmpl    $0,     %eax
    je      label_not_equal

    leal    -20(%ebp),  %edx        #str
    subl    %edx, %eax
    addl    $1,     %eax
    movl    %eax,   4(%esp)
    movl    $msg_main_found, (%esp)
    call    printf
    jmp     label_out

label_not_equal:
    movl    $msg_main_not_found, (%esp)
    call    printf

label_out:
    pushl   $0
    call    exit


.section    .text
.globl  MYstrchr
.type   MYstrchr,   @function
MYstrchr:
    pushl   %ebp
    movl    %esp,   %ebp

    subl    $4, %esp    #strlen param

    #8(%ebp) has str
    movl    8(%ebp),    %eax
    movl    %eax,       (%esp)
    call    Mystrlen            #answer in eax
    movl    %eax,   %ecx

    std     #setdirection flag for reverse traversal
    addl    %ecx,   8(%ebp)     #start from last
    movl    8(%ebp),    %edi
    decl    %edi
    xorl    %eax,   %eax
    movb    12(%ebp),   %al
    
    repne   scasb
    je      label_found
    movl    $0,     %eax    #NULL if not found
    jmp     label_mystrchr_out
label_found:
    addl    $1,     %edi
    movl    %edi,   %eax
label_mystrchr_out:
    cld
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
