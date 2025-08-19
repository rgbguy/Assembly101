.equ MAX1, 5
.equ MAX2, 10

.section .rodata
    msg_main_printEntervalueofplanesRowsCols:
    .string "Enter value of planes, rows & columns(< %d, %d, %d):\t"

    msg_main_scanPlaneRowCol:
    .string "%d%d%d"

    msg_main_printEnterEachValue:
    .string "Enter [%d][%d][%d] value:\t"

    msg_main_scanEachValue:
    .string "%d"

    msg_main_print_enteredElementsAre:
    .string "Entered elements are: \n"

    msg_main_print_valueIs:
    .string "[%d][%d][%d] value is:\t%d\n"

.section .text
.globl  main
.type   main, @function
main:
    andl    $-16,   %esp

    pushl   %ebp
    movl    %esp,   %ebp

    subl    $(24 + MAX1*MAX2*MAX2),  %esp
    subl    $20,    %esp                    #highest params

#524+20 = 544. 544/32 = 17. Exact 17. hence no spacing required

    movl    $MAX2, 12(%esp)
    movl    $MAX2, 8(%esp)
    movl    $MAX1, 4(%esp)
    movl    $msg_main_printEntervalueofplanesRowsCols, (%esp)
    call    printf

    leal    -4(%ebp),   %eax        #iPlanes
    leal    -8(%ebp),   %edx        #iRows
    leal    -12(%ebp),  %ecx        #iColumns
    movl    %ecx,   12(%esp)
    movl    %edx,   8(%esp)
    movl    %eax,   4(%esp)
    movl    $msg_main_scanPlaneRowCol,  (%esp)
    call    scanf

#for 1_1 starts
    movl    $0, -16(%ebp)
    jmp     label_for_1_1_condition
label_increment_for_1_1:
        addl    $1, -16(%ebp)
label_for_1_1_condition:
    movl    -16(%ebp),  %eax        #iCounter1
    movl    -4(%ebp),   %edx        #iPlanes
    cmpl    %edx,   %eax
    jge     label_for_1_1_exit

    #for 1_2 starts
        movl    $0, -20(%ebp)
        jmp     label_for_1_2_condition

label_increment_for_1_2:
        addl    $1, -20(%ebp)
label_for_1_2_condition:
        movl    -20(%ebp),  %eax        #iCounter2
        movl    -8(%ebp),   %edx        #iRows
        cmpl    %edx,   %eax
        jge     label_increment_for_1_1

        #for 1_3 starts
            movl    $0, -24(%ebp)
label_for_1_3_condition:
            movl    -24(%ebp),  %eax        #iCounter3
            movl    -12(%ebp),   %edx        #iColumns
            cmpl    %edx,   %eax
            jge     label_increment_for_1_2

            movl    -24(%ebp),  %eax
            movl    %eax,   12(%esp)
            movl    -20(%ebp),  %eax
            movl    %eax,   8(%esp)
            movl    -16(%ebp),  %eax
            movl    %eax,   4(%esp)
            movl    $msg_main_printEnterEachValue,  (%esp)
            call    printf
            
            #calculating flattened index = iCounter1*iColumns*iPlanes + iCounter2*iPlanes + iCounter3
            movl    -16(%ebp),  %eax    #iCounter1
            movl    -12(%ebp),  %ecx    #iColumns
            mull    %ecx                #output stored in %eax
            movl    -4(%ebp),   %ecx    #iPlanes
            mull    %ecx                #output stored in %eax
            movl    %eax,       %ebx

            movl    -20(%ebp),  %eax    #iCounter2
            movl    -4(%ebp),   %ecx    #iPlanes
            mull    %ecx                #output stored in %eax

            addl    %eax,   %ebx        #output stored in %ebx

            movl    -24(%ebp),  %eax    #iCounter3
            addl    %ebx,   %eax        #final flattend index stored in %eax

            leal    -544(%ebp, %eax, 4),    %ebx
            movl    %ebx,   4(%esp)
            movl    $msg_main_scanEachValue,    (%esp)
            call    scanf

            addl    $1, -24(%ebp)
            jmp     label_for_1_3_condition

label_for_1_1_exit:
    movl    $msg_main_print_enteredElementsAre, (%esp)
    call    printf
#================================================================================

#for 2_1 starts
    movl    $0, -16(%ebp)
    jmp     label_for_2_1_condition
label_increment_for_2_1:
        addl    $1, -16(%ebp)
label_for_2_1_condition:
    movl    -16(%ebp),  %eax        #iCounter1
    movl    -4(%ebp),   %edx        #iPlanes
    cmpl    %edx,   %eax
    jge     label_for_2_1_exit

    #for 2_2 starts
        movl    $0, -20(%ebp)
        jmp     label_for_2_2_condition
label_increment_for_2_2:
        addl    $1, -20(%ebp)
label_for_2_2_condition:
        movl    -20(%ebp),  %eax        #iCounter2
        movl    -8(%ebp),   %edx        #iRows
        cmpl    %edx,   %eax
        jge     label_increment_for_2_1

        #for 2_3 starts
            movl    $0, -24(%ebp)
label_for_2_3_condition:
            movl    -24(%ebp),  %eax        #iCounter3
            movl    -12(%ebp),   %edx        #iColumns
            cmpl    %edx,   %eax
            jge     label_increment_for_2_2
           
            #calculating flattened index = iCounter1*iColumns*iPlanes + iCounter2*iPlanes + iCounter3
            movl    -16(%ebp),  %eax    #iCounter1
            movl    -12(%ebp),  %ecx    #iColumns
            mull    %ecx                #output stored in %eax
            movl    -4(%ebp),   %ecx    #iPlanes
            mull    %ecx                #output stored in %eax
            movl    %eax,       %ebx

            movl    -20(%ebp),  %eax    #iCounter2
            movl    -4(%ebp),   %ecx    #iPlanes
            mull    %ecx                #output stored in %eax

            addl    %eax,   %ebx        #output stored in %ebx

            movl    -24(%ebp),  %eax    #iCounter3
            addl    %ebx,   %eax        #final flattend index stored in %eax

            movl    -544(%ebp, %eax, 4),    %ecx
            movl    %ecx,   16(%esp)
            movl    -24(%ebp),    %ecx
            movl    %ecx,     12(%esp)
            movl    -20(%ebp),    %ecx
            movl    %ecx,     8(%esp)
            movl    -16(%ebp),    %ecx
            movl    %ecx,     4(%esp)
            movl    $msg_main_print_valueIs,  (%esp)
            call    printf

            addl    $1, -24(%ebp)
            jmp     label_for_2_3_condition

label_for_2_1_exit:
    pushl   $0
    call    exit

