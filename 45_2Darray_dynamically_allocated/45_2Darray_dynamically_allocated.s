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

    subl    $20,    %esp        #local vars including ppPtr
    movl    $0,     -20(%ebp)   #ppPtr = NULL

    pushl   $msg_main_enter_value_of_rowcol
    call    printf
    addl    $4, %esp

    leal    -4(%ebp),   %ebx    #&iRows
    leal    -8(%ebp),   %eax    #&iColumns
    pushl   %eax
    pushl   %ebx
    pushl   $msg_main_scan_rowcolval
    call    scanf
    addl    $12,    %esp

#malloc and nullcheck
    movl    -4(%ebp),   %eax    #iRows
    movl    $4, %ecx            #sizeof(int*)
    mull    %ecx                #iRows * sizeof(int*) stored in eax
    pushl   %eax
    call    malloc              #output of malloc stored in eax
    addl    $4, %esp
    movl    %eax,   -20(%ebp)   #output of malloc stored in ppPtr
    movl    $0, %edx
    cmpl    %eax,   %edx        #NULLCHECK
    je      label_memfail

#for11
    movl    $0, -12(%ebp)       #iCounter1 = 0
    jmp     label_for11_condition

label_for11:
    movl    -8(%ebp),   %eax    #iColumns
    movl    $4,         %ecx    #sizeof(int)
    mull    %ecx                #iColumns * sizeof(int) -> output stored in eax
    pushl   %eax
    call    malloc              #output of malloc stored in eax
    addl    $4, %esp

    movl    -20(%ebp),  %ebx    #ppPtr
    movl    -12(%ebp),  %ecx    #iCounter1  
    movl    %eax,   (%ebx, %ecx, 4) #malloc output stored in ppPtr[iCounter1]
    movl    $0, %edx
    cmpl    %eax,   %edx        #NULLCHECK
    je      label_memfail

    #for12
        movl    $0, -16(%ebp)       #iCounter2 = 0
        jmp     label_for12_condition

    label_for12:
        pushl   -16(%ebp)       #iCounter2
        pushl   -12(%ebp)       #iCounter1
        pushl   $msg_main_enter_each_value
        call    printf
        addl    $12,    %esp

        movl    -20(%ebp),  %ebx    #ppPtr
        movl    -12(%ebp),  %ecx    #iCounter1  
        movl    (%ebx, %ecx, 4),    %ebx    #ppPtr[iCounter1]
        movl    -16(%ebp),  %ecx    #iCounter2 
        leal    (%ebx, %ecx, 4),    %ebx     #&ppPtr[iCounter1][iCounter2]
        pushl   %ebx
        pushl   $msg_main_scanf_each_value
        call    scanf
        addl    $8, %esp

        addl    $1,     -16(%ebp)   #increment iCounter2

    label_for12_condition:
        movl    -16(%ebp),  %eax    #iCounter2
        movl    -8(%ebp),   %edx    #iColumns
        cmpl    %edx,   %eax        #iCounter2 < iColumns
        jl      label_for12

    addl    $1,     -12(%ebp)   #increment iCounter1
label_for11_condition:
    movl    -12(%ebp),  %eax    #iCounter1
    movl    -4(%ebp),   %edx    #iRows
    cmpl    %edx,   %eax        #iCounter1 < iRows
    jl      label_for11

#===========================================================================
    pushl   $msg_main_entered_elements_are
    call    printf
    addl    $4, %esp
#===========================================================================

#for21
    movl    $0, -12(%ebp)       #iCounter1 = 0
    jmp     label_for21_condition

label_for21:
    #for22
        movl    $0, -16(%ebp)       #iCounter2 = 0
        jmp     label_for22_condition

    label_for22:
        movl    -20(%ebp),  %ebx        #base address of ppPtr
        movl    -12(%ebp),  %eax        #iCounter1
        movl    (%ebx, %eax, 4), %ebx   #ppPtr[iCounter1]
        movl    -16(%ebp),  %eax        #iCounter2
        movl    (%ebx, %eax, 4),    %eax
        pushl   %eax
        pushl   -16(%ebp)       #iCounter2
        pushl   -12(%ebp)       #iCounter1
        pushl   $msg_main_print_each_value
        call    printf
        addl    $16,    %esp

        addl    $1,     -16(%ebp)   #increment iCounter2

    label_for22_condition:
        movl    -16(%ebp),  %eax    #iCounter2
        movl    -8(%ebp),   %edx    #iColumns
        cmpl    %edx,   %eax        #iCounter2 < iColumns
        jl      label_for22

    addl    $1,     -12(%ebp)   #increment iCounter1
label_for21_condition:
    movl    -12(%ebp),  %eax    #iCounter1
    movl    -4(%ebp),   %edx    #iRows
    cmpl    %edx,   %eax        #iCounter1 < iRows
    jl      label_for21

    pushl   $0
    call    exit
    
label_memfail:
    pushl   $msg_main_memfailed
    call    puts
    addl    $4, %esp
    pushl   $-1
    call    exit
    