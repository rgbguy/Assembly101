.section    .rodata
    msg_main_print_enter_obj2val:
    .string "Enter obj2 values,\n"

    msg_main_print_enter_chChar:
    .string "Enter chChar\t:"

    msg_main_print_enter_iNo:
    .string "Enter iNo\t:"

    msg_main_print_enter_shiNo:
    .string "Enter shiNo\t:"

    msg_main_scan_chChar:
    .string "%c"

    msg_main_scan_iNo:
    .string "%d"

    msg_main_scan_shiNo:
    .string "%hd"

    msg_main_print_obj2is:
    .string "Obj2 is\n"

    msg_main_print_obj3is:
    .string "\nObj3 is\n"

    msg_main_print_obj_values:
    .string "chChar = %c, iNo = %d, shiNo = %hd\n"

    msg_main_print_obj1is:
    .string "\nObj1 is\n"

.section    .bss
.comm       obj1    12, 4

.section    .text
.globl      main
.type       main,   @function
main:
    pushl   %ebp
    movl    %esp,   %ebp

    subl    $24,    %esp

    pushl   $msg_main_print_enter_obj2val
    call    printf
    addl    $4,     %esp

    pushl   $msg_main_print_enter_chChar
    call    printf
    addl    $4,     %esp

    leal    -12(%ebp),  %eax
    pushl   %eax
    pushl   $msg_main_scan_chChar
    call    scanf
    addl    $8,     %esp

    pushl   $msg_main_print_enter_iNo
    call    printf
    addl    $4,     %esp

    leal    -8(%ebp),  %eax
    pushl   %eax
    pushl   $msg_main_scan_iNo
    call    scanf
    addl    $8,     %esp

    pushl   $msg_main_print_enter_shiNo
    call    printf
    addl    $4,     %esp

    leal    -4(%ebp),  %eax
    pushl   %eax
    pushl   $msg_main_scan_shiNo
    call    scanf
    addl    $8,     %esp

    pushl   $msg_main_print_obj2is
    call    printf
    addl    $4,     %esp

    pushl   -4(%ebp)
    pushl   -8(%ebp)
    pushl   -12(%ebp)
    pushl   $msg_main_print_obj_values
    call    printf
    addl    $16,    %esp

    leal    obj1,   %ebx
    movb    -12(%ebp),  %al
    movb    %al,    (%ebx)
    movl    -8(%ebp),  %eax
    movl    %eax,    4(%ebx)
    movl    -4(%ebp),  %eax
    movl    %eax,    8(%ebx)

    leal    -24(%ebp),   %ebx
    movb    -12(%ebp),  %al
    movb    %al,    (%ebx)
    movl    -8(%ebp),  %eax
    movl    %eax,    4(%ebx)
    movl    -4(%ebp),  %eax
    movl    %eax,    8(%ebx)

    pushl   $msg_main_print_obj1is
    call    printf
    addl    $4,     %esp

    leal    obj1,   %eax
    movl    (%eax), %edx    
    movl    4(%eax), %ecx    
    movl    8(%eax), %ebx
    pushl   %ebx
    pushl   %ecx
    pushl   %edx
    pushl   $msg_main_print_obj_values
    call    printf
    addl    $16,    %esp

    pushl   $msg_main_print_obj3is
    call    printf
    addl    $4,     %esp

    pushl   -16(%ebp)
    pushl   -20(%ebp)
    pushl   -24(%ebp)
    pushl   $msg_main_print_obj_values
    call    printf
    addl    $16,    %esp

    pushl   $0
    call    exit


