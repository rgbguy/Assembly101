.equ    MAX,    10

.section    .rodata
    msg_main_print_entervalueofn:
    .string "Enter value of n(<%d):\t"

    msg_main_scan:
    .string "%d"

    msg_main_print_entervalues:
    .string "Enter %d value:\t"

    msg_main_print_arr1is:
    .string "arr1 is:\n"

    msg_main_print:
    .string "%d value is:\t%d\n"

    msg_main_print_arr2is:
    .string "arr2 is:\n"   

.section    .data
.globl      arr1
.type       arr1,   @function
.size       arr1,   12
.align      4
arr1:
    .int    10, 20, 30

.section    .bss
.comm       arr2,  MAX*4,   4

.section    .text
.globl      main
.type       main,   @function
main:
    pushl   %ebp
    movl    %esp,   %ebp

    subl    $8, %esp

    pushl   $MAX
    pushl   $msg_main_print_entervalueofn
    call    printf
    addl    $8, %esp

    leal    -4(%ebp),   %eax
    pushl   %eax
    pushl   $msg_main_scan
    call    scanf
    addl    $8, %esp

    #for1 starts
    movl    $0, -8(%ebp)
    jmp     label_for1_condition

label_for1_loop:
    pushl   -8(%ebp)
    pushl   $msg_main_print_entervalues
    call    printf
    addl    $8, %esp

    movl    -8(%ebp),   %eax
    leal    arr2(, %eax, 4),    %edx
    pushl   %edx
    pushl   $msg_main_scan
    call    scanf
    addl    $8, %esp

    addl    $1, -8(%ebp)

label_for1_condition:
    movl    -4(%ebp),   %eax        #iMax
    movl    -8(%ebp),   %edx        #iCounter
    cmpl    %eax,   %edx
    jl      label_for1_loop
    #for1 ends

    pushl   $msg_main_print_arr1is
    call    printf
    addl    $4, %esp

    #for2 starts
    movl    $0, -8(%ebp)
    jmp     label_for2_condition

label_for2_loop:
    pushl   arr1(, %edx, 4)                 #edx already has iCounter
    pushl   -8(%ebp)
    pushl   $msg_main_print
    call    printf
    addl    $12, %esp

    addl    $1, -8(%ebp)

label_for2_condition:
    movl    $3,         %eax        #3
    movl    -8(%ebp),   %edx        #iCounter
    cmpl    %eax,   %edx
    jl      label_for2_loop    
    #for2 ends

    pushl   $msg_main_print_arr2is
    call    printf
    addl    $4, %esp

    #for3 starts
    movl    $0, -8(%ebp)
    jmp     label_for3_condition

label_for3_loop:
    pushl   arr2(, %edx, 4)                 #edx already has iCounter
    pushl   -8(%ebp)
    pushl   $msg_main_print
    call    printf
    addl    $12, %esp

    addl    $1, -8(%ebp)

label_for3_condition:
    movl    -4(%ebp),   %eax        #iMax
    movl    -8(%ebp),   %edx        #iCounter
    cmpl    %eax,   %edx
    jl      label_for3_loop    
    #for3 ends

    pushl   $0
    call    exit

