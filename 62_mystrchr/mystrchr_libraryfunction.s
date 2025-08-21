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
    call    strchr
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
