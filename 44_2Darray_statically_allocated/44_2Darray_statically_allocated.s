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

    #for11 starts
    movl    $0, -12(%ebp)
    jmp     label_for11_condition

label_for11_condition:
    movl    -4(%ebp),   %eax
    movl    -12(%ebp),  %edx
    cmpl    %eax    ,%edx
    jge     label_for11_exit

        #for12 starts
        movl    $0, -16(%ebp)
        jmp     label_for12_condition

        label_for12_condition:
        movl    -8(%ebp),   %eax
        movl    -16(%ebp),  %edx
        cmpl    %eax,   %edx
        jge     label_increment_iCounter11

        pushl   -16(%ebp)
        pushl   -12(%ebp)
        pushl   $msg_main_enter_each_value
        call    printf
        addl    $12,    %esp

        movl    -8(%ebp),   %eax
        movl    -12(%ebp),  %ecx
        mull    %ecx
        addl    -16(%ebp),  %eax    #output of mull is in eax. we add it with counter2

        leal    -16 - 4*MAX*MAX(%ebp), %ecx    # Get base address of array into %ecx
        leal    (%ecx,  %eax, 4),       %edx
        pushl   %edx
        pushl   $msg_main_scanf_each_value
        call    scanf
        addl    $8, %esp

        addl    $1, -16(%ebp)

        jmp     label_for12_condition

label_increment_iCounter11:
    addl    $1, -12(%ebp)
    jmp     label_for11_condition


label_for11_exit:

#============================================================


    #for21 starts
    movl    $0, -12(%ebp)
    jmp     label_for21_condition

label_for21_condition:
    movl    -4(%ebp),   %eax
    movl    -12(%ebp),  %edx
    cmpl    %eax    ,%edx
    jge     label_for21_exit

        #for22 starts
        movl    $0, -16(%ebp)
        jmp     label_for22_condition

        label_for22_condition:
        movl    -8(%ebp),   %eax
        movl    -16(%ebp),  %edx
        cmpl    %eax,   %edx
        jge     label_increment_iCounter21

        movl    -8(%ebp),   %eax
        movl    -12(%ebp),  %ecx
        mull    %ecx
        addl    -16(%ebp),  %eax    #output of mull is in eax. we add it with counter2

        leal    -16 - 4*MAX*MAX(%ebp), %ecx
        movl    (%ecx,  %eax, 4),       %edx
        pushl   %edx
        pushl   -16(%ebp)
        pushl   -12(%ebp)
        pushl   $msg_main_print_each_value
        call    printf
        addl    $16, %esp

        addl    $1, -16(%ebp)

        jmp     label_for22_condition

label_increment_iCounter21:
    addl    $1, -12(%ebp)
    jmp     label_for21_condition

#============================================================
label_for21_exit:
    pushl   $0
    call    exit
