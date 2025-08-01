.equ MAX1, 5
.equ MAX2, 10
.section .rodata
    msg_main_entervalueofPRC:
    .string "Enter value of planes, rows & columns (< %d, %d, %d):\t"

    msg_main_scanPRC:
    .string "%d%d%d"

    msg_main_print_entereachvalue:
    .string "Enter [%d][%d][%d] value:\t"

    msg_main_scan_eachvalue:
    .string "%d"

    msg_main_print_enteredElements:
    .string "Entered elements are:\n"

    msg_main_print_enteredValueis:
    .string "Entered [%d][%d][%d] value is:\t%d\n"

.section    .text
.globl  main
.type   main,   @function
main:
    addl    $-16,   %esp    #alignment with 16
    pushl   %ebp
    movl    %esp,   %ebp

    subl    $24,    %esp
    subl    $2000,  %esp    #4*5*10*10
    subl    $20,    %esp    #highest params in printf = 5
    subl    $4,     %esp    #alignment to 16 (128*16 = 2048)

    movl    $MAX2,  12(%esp)
    movl    $MAX2,  8(%esp)
    movl    $MAX1,  4(%esp)
    movl    $msg_main_entervalueofPRC,  (%esp)
    call    printf

    leal    -12(%ebp),   %ebx
    movl    %ebx,   12(%esp)            #&iColumns
    leal    -8(%ebp),   %ebx
    movl    %ebx,   8(%esp)             #&iRows
    leal    -4(%ebp),   %ebx
    movl    %ebx,   4(%esp)             #&iPlanes
    movl    $msg_main_scanPRC, (%esp)
    call    scanf

#for_11
    movl    $0, -16(%ebp)           #iCounter1 = 0
    jmp     label_for_11condition

label_for11:
    #for_12
        movl    $0, -20(%ebp)           #iCounter2 = 0
        jmp     label_for_12condition

    label_for12:
        #for_13
            movl    $0, -24(%ebp)           #iCounter3 = 0
            jmp     label_for_13condition

        label_for13:
            movl    -24(%ebp),   %eax
            movl    %eax,       12(%esp)
            movl    -20(%ebp),   %eax
            movl    %eax,       8(%esp)
            movl    -16(%ebp),   %eax
            movl    %eax,       4(%esp)
            movl    $msg_main_print_entereachvalue, (%esp)
            call    printf

            #index = i*row*col + j*col + k
            movl    -16(%ebp),  %eax        #iCounter1
            movl    -8(%ebp),   %ecx        #iRows
            mull    %ecx                    #iCounter1*iRows => stored in eax
            movl    -12(%ebp),  %ecx        #iColumns
            mull    %ecx                    #iCounter1*iRows*iColumns => stored in eax
            movl    %eax,   %ebx            #temporary stored
            movl    -20(%ebp),  %eax        #iCounter2
            movl    -12(%ebp),  %ecx         #iColumns
            mull    %ecx                    #iCounter2*iColumns => stored in eax
            addl    %ebx,   %eax            #iCounter1*iRows*iColumns + iCounter2*iColumns
            addl    -24(%ebp),  %eax        #iCounter1*iRows*iColumns + iCounter2*iColumns + iCounter3
            leal    -2024(%ebp,  %eax, 4),  %ebx    #&arr[iCounter1][iCounter2][iCounter3]
            movl    %ebx,   4(%esp)
            movl    $msg_main_scan_eachvalue,   (%esp)
            call    scanf
            addl    $1, -24(%ebp)
        label_for_13condition:
            movl    -12(%ebp),   %eax       #iColumns
            movl    -24(%ebp),  %edx        #iCounter3
            cmpl    %eax,   %edx
            jl      label_for13

        addl    $1, -20(%ebp)
    label_for_12condition:
        movl    -8(%ebp),   %eax        #iRows
        movl    -20(%ebp),  %edx        #iCounter2
        cmpl    %eax,   %edx
        jl      label_for12

    addl    $1, -16(%ebp)
label_for_11condition:
    movl    -4(%ebp),   %eax        #iPlanes
    movl    -16(%ebp),  %edx        #iCounter1
    cmpl    %eax,   %edx
    jl      label_for11
#==============================================================
    movl    $msg_main_print_enteredElements,    (%esp)
    call    printf
#==============================================================
#for_21
    movl    $0, -16(%ebp)           #iCounter1 = 0
    jmp     label_for_21condition

label_for21:
    #for_22
        movl    $0, -20(%ebp)           #iCounter2 = 0
        jmp     label_for_22condition

    label_for22:
        #for_23
            movl    $0, -24(%ebp)           #iCounter3 = 0
            jmp     label_for_23condition

        label_for23:
            #index = i*row*col + j*col + k
            movl    -16(%ebp),  %eax        #iCounter1
            movl    -8(%ebp),   %ecx        #iRows
            mull    %ecx                    #iCounter1*iRows => stored in eax
            movl    -12(%ebp),  %ecx        #iColumns
            mull    %ecx                    #iCounter1*iRows*iColumns => stored in eax
            movl    %eax,   %ebx            #temporary stored
            movl    -20(%ebp),  %eax        #iCounter2
            movl    -12(%ebp),  %ecx         #iColumns
            mull    %ecx                    #iCounter2*iColumns => stored in eax
            addl    %ebx,   %eax            #iCounter1*iRows*iColumns + iCounter2*iColumns
            addl    -24(%ebp),  %eax        #iCounter1*iRows*iColumns + iCounter2*iColumns + iCounter3
            movl    -2024(%ebp,  %eax, 4),  %ebx    #&arr[iCounter1][iCounter2][iCounter3]
            movl    %ebx,   16(%esp)
            movl    -24(%ebp),   %eax
            movl    %eax,       12(%esp)
            movl    -20(%ebp),   %eax
            movl    %eax,       8(%esp)
            movl    -16(%ebp),   %eax
            movl    %eax,       4(%esp)
            movl    $msg_main_print_enteredValueis, (%esp)
            call    printf

            addl    $1, -24(%ebp)
        label_for_23condition:
            movl    -12(%ebp),   %eax       #iColumns
            movl    -24(%ebp),  %edx        #iCounter3
            cmpl    %eax,   %edx
            jl      label_for23

        addl    $1, -20(%ebp)
    label_for_22condition:
        movl    -8(%ebp),   %eax        #iRows
        movl    -20(%ebp),  %edx        #iCounter2
        cmpl    %eax,   %edx
        jl      label_for22

    addl    $1, -16(%ebp)
label_for_21condition:
    movl    -4(%ebp),   %eax        #iPlanes
    movl    -16(%ebp),  %edx        #iCounter1
    cmpl    %eax,   %edx
    jl      label_for21

    pushl   $0
    call    exit
