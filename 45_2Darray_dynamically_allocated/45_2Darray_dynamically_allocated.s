.equ MAX, 10

.section    .rodata
    msg_main_enter_value_of_rowcol:
    .string "Enter value of rows & columns\t"

    msg_main_scan_rowcolval:
    .string "%d%d"

    msg_main_memfailed:
    .string "Memory allocation failed"

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
    subl    $4,     %esp                #space for ppPtr

    pushl   $msg_main_enter_value_of_rowcol
    call    printf
    addl    $4, %esp

    leal    -4(%ebp),   %ecx
    leal    -8(%ebp),   %ebx
    pushl   %ebx
    pushl   %ecx
    pushl   $msg_main_scan_rowcolval
    call    scanf
    addl    $12,    %esp

    movl    -4(%ebp),   %eax
    movl    $4, %ecx
    mull    %ecx            #eax now has value iRows*4
    pushl   %eax
    call    malloc          #malloc will return adress in eax
    addl    $4, %esp
    movl    %eax,   -20(%ebp)   #address stored in ppPtr

    movl    $0, %edx
    cmpl    %eax,   %edx
    je      label_memfailed

    #for11 starts
    movl    $0, -12(%ebp)
    jmp     label_for11_condition

label_for11_condition:
    movl    -4(%ebp),   %eax
    movl    -12(%ebp),  %edx
    cmpl    %eax    ,%edx
    jge     label_for11_exit

    movl    -8(%ebp),   %eax
    movl    $4, %ecx
    mull    %ecx            #eax now has value iCol*4
    pushl   %eax
    call    malloc          #malloc will return adress in eax
    addl    $4, %esp
    movl    -20(%ebp),  %ebx
    movl    -12(%ebp),  %ecx
    movl    %eax,   (%ebx, %ecx, 4)   #address stored in ppPtr[iCounter1]

    movl    $0, %edx
    cmpl    %eax,   %edx
    je      label_memfailed

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

        movl    -20(%ebp),  %ebx
        movl    -12(%ebp),  %ecx
        movl    (%ebx, %ecx, 4),    %ebx

        movl    -16(%ebp),  %ecx
        leal    (%ebx, %ecx, 4),    %ebx

        pushl   %ebx
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

    pushl   $msg_main_entered_elements_are
    call    printf
    addl    $4, %esp

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

        movl    -20(%ebp),  %ebx
        movl    -12(%ebp),  %ecx
        movl    (%ebx, %ecx, 4),    %ebx

        movl    -16(%ebp),  %ecx
        movl    (%ebx, %ecx, 4),    %ebx

        pushl   %ebx
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

#free for starts
    movl    $0, -12(%ebp)

label_forFREE_condition:
    movl    -4(%ebp),   %eax
    movl    -12(%ebp),  %edx
    cmpl    %eax    ,%edx
    jge     label_forFREE_exit

    movl    -20(%ebp),  %ebx
    movl    -12(%ebp),  %ecx
    movl    (%ebx, %ecx, 4),    %ebx
    pushl   %ebx
    call    free
    addl    $4, %esp

    movl    -20(%ebp),  %ebx
    movl    -12(%ebp),  %ecx
    movl    $0, (%ebx, %ecx, 4)

    addl    $1, -12(%ebp)
    jmp     label_forFREE_condition

label_forFREE_exit:
    pushl   -20(%ebp)
    call    free
    addl    $4, %esp

label_for21_exit:
    pushl   $0
    call    exit

label_memfailed:
    pushl   $msg_main_memfailed
    call    puts
    addl    $4, %esp

    pushl   $-1
    call    exit
    