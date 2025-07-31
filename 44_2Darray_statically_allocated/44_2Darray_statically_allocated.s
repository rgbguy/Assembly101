.equ MAX, 10

.section    .rodata
    msg_main_enter_value_of_rowcol:
    .string "Enter value of rows & columns(< %d)\t"

    msg_main_scan_rowcolval:
    .string "%d%d"

    msg_main_enter_each_value:
    .string "Enter [%d][%d] value:\t"

    msg_main_scanf_each_value:
    .string "%d"

    msg_main_entered_elements_are:
    .string "Entered elements are:\n"

    msg_main_print_each_value:
    .string "[%d][%d] value is:\t%d\n"

.section   .text
.globl  main
.type   main,   @function
main:
    pushl   %ebp
    movl    %esp,   %ebp

    subl    $16,    %esp
    subl    $(4*MAX*MAX),   %esp

    pushl   $MAX
    pushl   $msg_main_enter_value_of_rowcol
    call    printf
    addl    $8, %esp

    leal    -4(%ebp),   %ecx
    leal    -8(%ebp),   %ebx
    pushl   %ebx
    pushl   %ecx
    pushl   $msg_main_scan_rowcolval
    call    scanf
    addl    $12,    %esp

#========================================================================
    movl    $0, -12(%ebp)
    jmp     label_for11_condition

label_for11:
    addl    $1, -12(%ebp)

        movl    $0, -16(%ebp)
        jmp     label_for12_condition

    label_for12:
        addl    $1, -16(%ebp)
        pushl   -16(%ebp)
        pushl   -12(%ebp)
        pushl   $msg_main_enter_each_value
        call    printf
        addl    $12,    %esp

        movl    -8(%ebp),   %eax    #iColumns
        movl    -12(%ebp),  %ecx    #iCounter1
        mull    %ecx                #iCounter1*iRows = result stored in eax
        addl    -16(%ebp),   %eax    #final index
        leal    -(16+4*MAX*MAX)(%ebp), %ecx
        leal    (%ecx,  %eax, 4),       %edx
        pushl   %edx
        pushl   $msg_main_scanf_each_value
        call    scanf
        addl    $8, %esp

    label_for12_condition:
        movl    -8(%ebp),   %eax    #iColumns
        movl    -16(%ebp),  %edx    #iCounter2
        cmpl    %eax,   %edx
        jl      label_for12

label_for11_condition:
    movl    -4(%ebp),   %eax    #iRows
    movl    -12(%ebp),  %edx    #iCounter1
    cmpl    %eax,   %edx
    jl      label_for11
#========================================================================
    pushl   $msg_main_entered_elements_are
    call    printf
    addl    $4, %esp
#========================================================================

    movl    $0, -12(%ebp)
    jmp     label_for21_condition

label_for21:
    addl    $1, -12(%ebp)

        movl    $0, -16(%ebp)
        jmp     label_for22_condition

    label_for22:
        addl    $1, -16(%ebp)

        movl    -8(%ebp),   %eax    #iColumns
        movl    -12(%ebp),  %ecx    #iCounter1
        mull    %ecx                #iCounter1*iRows = result stored in eax
        addl    -16(%ebp),   %eax    #final index
        leal    -(16+4*MAX*MAX)(%ebp), %ecx
        movl    (%ecx,  %eax, 4),       %edx
        pushl   %edx
        pushl   -16(%ebp)
        pushl   -12(%ebp)
        pushl   $msg_main_print_each_value
        call    printf
        addl    $16, %esp

    label_for22_condition:
        movl    -8(%ebp),   %eax    #iColumns
        movl    -16(%ebp),  %edx    #iCounter2
        cmpl    %eax,   %edx
        jl      label_for22

label_for21_condition:
    movl    -4(%ebp),   %eax    #iRows
    movl    -12(%ebp),  %edx    #iCounter1
    cmpl    %eax,   %edx
    jl      label_for21
#========================================================================

    pushl   $0
    call    exit
