.equ    MAX,    10

.section    .rodata
    msg_main_print_entervalueofn:
    .string "Enter value of n:\t"

    msg_main_scan:
    .string "%d"

    msg_main_print_Entervalue:
    .string "Enter %d value:\t"

    msg_main_print_EnteredElementsAre:
    .string "Entered elements are:\n"

    msg_main_print_value_is:
    .string "%d value is:\t%d\n"

.section    .text
.globl      main
.type       main,   @function
main:
    pushl   %ebp
    movl    %esp,   %ebp

    subl    $8, %esp
    subl    $(4*MAX),   %esp

    pushl   $msg_main_print_entervalueofn
    call    printf
    addl    $4, %esp

    leal    -4(%ebp),   %eax
    pushl   %eax
    pushl   $msg_main_scan
    call    scanf
    addl    $8,     %esp

    #for 1 starts
    movl    $0, -8(%ebp)
    jmp     label_for1_condition

label_for1_loop:
    pushl   %edx                        #iCounter already present in edx
    pushl   $msg_main_print_Entervalue
    call    printf
    addl    $8, %esp

    movl    -8(%ebp),   %eax            # i
    movl    -12(%ebp),  %ecx
    leal    (-8-MAX*4)(%ebp,%eax,4),  %edx 
    pushl   %edx
    pushl   $msg_main_scan
    call    scanf

    addl    $8, %esp

    addl    $1, -8(%ebp)

label_for1_condition:
    movl    -4(%ebp),   %eax    #iMax
    movl    -8(%ebp),   %edx    #iCounter
    cmpl    %eax,   %edx
    jl      label_for1_loop

    pushl   $msg_main_print_EnteredElementsAre
    call    printf
    addl    $4, %esp

    #for 2 starts
    movl    $0, -8(%ebp)
    jmp     label_for2_condition

label_for2_loop:
    movl    -8(%ebp),           %edx            #Load loop counter (i)
    movl    (-8-MAX*4)(%ebp, %edx, 4), %eax
    pushl   %eax
    pushl   %edx
    pushl   $msg_main_print_value_is
    call    printf
    addl    $12, %esp


    addl    $1, -8(%ebp)

label_for2_condition:
    movl    -4(%ebp),   %eax    #iMax
    movl    -8(%ebp),   %edx    #iCounter
    cmpl    %eax,   %edx
    jl      label_for2_loop
    #for 2 ends

    pushl   $0
    call    exit
