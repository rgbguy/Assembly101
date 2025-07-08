.section    .rodata
    msg_main_printObj1is:
    .string "Obj1 is \n"

    msg_main_printObj1Value:
    .string "chChar = %c, iNo = %d, shiNo = %hd\n\n"

    msg_main_printObj2is:
    .string "Obj2 is \n"

    msg_main_printObj2Value:
    .string "Obj1 is \n"

.section    .data
.globl  obj1
.type   obj1,   @object
.size   obj1,   12
.align  4
obj1:
    .ascii   "A"
    .zero   3
    .int    10
    .value  20

.section    .text
.globl  main
.type   main,   @function
main:
    pushl   %ebp
    movl    %esp,   %ebp

    subl    $12,    %esp

    movb    $'B',   -12(%ebp)
    movl    $30,    -8(%ebp)
    movw    $40,    -4(%ebp)

    pushl   $msg_main_printObj2is
    call    printf
    addl    $4, %esp

    pushl   -4(%ebp)
    pushl   -8(%ebp)
    pushl   -12(%ebp)
    pushl   $msg_main_printObj1Value
    call    printf
    addl    $16,    %esp

    pushl   $msg_main_printObj1is
    call    printf
    addl    $4, %esp

    leal    obj1,   %ebx
    xorl    %eax,   %eax
    movb    (%ebx), %al
    movl    4(%ebx),    %edx
    xorl    %ecx,   %ecx
    movl    8(%ebx),    %ecx
    pushl   %ecx
    pushl   %edx
    pushl   %eax
    pushl   $msg_main_printObj1Value
    call    printf
    addl    $16,    %esp
    
    pushl   $0
    call    exit
