.section    .rodata
    msg_main_print_obj1is:
    .string "Obj1 is\n"

    msg_main_print_obj2is:
    .string "Obj2 is\n"

    msg_main_print_obj3is:
    .string "Obj3 is\n"

    msg_main_print_obj_values:
    .string "chChar = %c, iNo = %d, shiNo = %hd\n\n"

    msg_main_print_obj1_2comparison:
    .string "obj1 & obj2 comparison is "

    msg_main_print_obj2_3comparison:
    .string "obj2 & obj3 comparison is "

    msg_main_print_equal:
    .string "equal\n\n"

    msg_main_print_not_equal:
    .string "not equal\n\n"

.section    .data
.globl      obj1
.type       obj1,   @function
.size       obj1, 12
.align      4
obj1:
    .ascii  "A"
    .zero   3
    .int    10
    .value  20

.section    .text
.globl      main
.type       main,   @function
main:
    pushl   %ebp
    movl    %esp,   %ebp

    subl    $12,    %esp
    movb    $'B',   -12(%ebp)
    movl    $30,   -8(%ebp)
    movw    $40,   -4(%ebp)

    subl    $12,    %esp
    movb    $'B',   -24(%ebp)
    movl    $30,   -20(%ebp)
    movw    $40,   -16(%ebp)

    pushl   $msg_main_print_obj1is
    call    printf
    addl    $4,     %esp

    leal    obj1,       %ebx
    xorl    %eax,       %eax
    movb    (%ebx),     %al
    movl    4(%ebx),    %edx
    movl    8(%ebx),    %ecx
    pushl   %ecx
    pushl   %edx
    pushl   %eax
    pushl   $msg_main_print_obj_values
    call    printf
    addl    $16,        %esp

    pushl   $msg_main_print_obj2is
    call    printf
    addl    $4,     %esp

    xorl    %eax,       %eax
    movb    -12(%ebp),  %al
    movl    -8(%ebp),   %edx
    movl    -4(%ebp),   %ecx
    pushl   %ecx
    pushl   %edx
    pushl   %eax
    pushl   $msg_main_print_obj_values
    call    printf
    addl    $16,        %esp   

    pushl   $msg_main_print_obj3is
    call    printf
    addl    $4,     %esp

    xorl    %eax,       %eax
    movb    -24(%ebp),  %al
    movl    -20(%ebp),   %edx
    movl    -16(%ebp),   %ecx
    pushl   %ecx
    pushl   %edx
    pushl   %eax
    pushl   $msg_main_print_obj_values
    call    printf
    addl    $16,        %esp   

    pushl   $msg_main_print_obj1_2comparison
    call    printf
    addl    $4,     %esp

    leal    obj1,   %ebx
    movb    (%ebx), %al
    movb    -12(%ebp),  %dl
    cmpb    %al,    %dl
    jne     label_not_equal_1
    movl    4(%ebx), %eax
    movl    -8(%ebp),  %edx
    cmpl    %eax,    %edx
    jne     label_not_equal_1
    movw    8(%ebx), %ax
    xorl    %edx,   %edx
    movw    -4(%ebp),  %dx
    cmpw    %ax,    %dx
    jne     label_not_equal_1
    pushl   $msg_main_print_equal
    call    printf
    addl    $4, %esp

label_second_comparison:
    pushl   $msg_main_print_obj2_3comparison
    call    printf
    addl    $4,     %esp

    leal    -12(%ebp),   %ebx
    movb    (%ebx), %al
    movb    -24(%ebp),  %dl
    cmpb    %al,    %dl
    jne     label_not_equal_2
    movl    4(%ebx), %eax
    xorl    %edx,   %edx
    movl    -20(%ebp),  %edx
    cmpl    %eax,    %edx
    jne     label_not_equal_2
    movw    8(%ebx), %ax
    movw    -16(%ebp),  %dx
    cmpw    %ax,    %dx
    jne     label_not_equal_2
    pushl   $msg_main_print_equal
    call    printf
    addl    $4, %esp
    jmp     label_out

label_not_equal_1:
    pushl   $msg_main_print_not_equal
    call    printf
    addl    $4, %esp
    jmp     label_second_comparison

label_not_equal_2:
    pushl   $msg_main_print_not_equal
    call    printf
    addl    $4, %esp

label_out:
    pushl   $0
    call    exit


