.section    .rodata
    msg_main_print_enter_valueofPRC:
    .string "Enter value of planes, rows and columns:\t"

    msg_main_scan_PRC:
    .string "%d%d%d"

    msg_main_print_memFailed:
    .string "Memory allocation FAILED"

    msg_main_print_enter_eachvalue:
    .string "Enter [%d][%d][%d] value:\t"

    msg_main_scan_each_value:
    .string "%d"

    msg_main_print_enteredElementsAre:
    .string "Entered elements are:\n"

    msg_main_print_each_value:
    .string "Enter [%d][%d][%d] value is:\t%d\n"

.section    .text
.globl  main
.type   main,   @function
main:
    pushl   %ebp
    movl    %esp,   %ebp

    addl    $-16,   %esp    #COMPILER'S METHOD: Align esp to nearest 16
    subl    $28,    %esp    #space for localvars and pppPtr
    subl    $20,    %esp    #space for highest number of params = 5 (in printf)
                            #28+20 = 48. 48/16 = 3. Exact alignment found. No need of extra space.

    movl    $msg_main_print_enter_valueofPRC, (%esp)
    call    printf
    
    leal    -12(%ebp),  %eax
    movl    %eax,       12(%esp)        #&iColumns
    leal    -8(%ebp),   %eax
    movl    %eax,       8(%esp)         #&iRows
    leal    -4(%ebp),   %eax
    movl    %eax,       4(%esp)         #&iPlanes
    movl    $msg_main_scan_PRC, (%esp)
    call    scanf

    movl    $4, %eax                    #sizeof(int**)
    movl    -4(%ebp),   %ecx            #iPlanes
    mull    %ecx                        #iPlanes * sizeof(int**) => answer in eax
    movl    %eax,   (%esp)              #malloc arguments
    call    malloc                      #address of malloc-ed memory start stored in eax
    movl    %eax,   -28(%ebp)           #malloc-ed memory address stored in pppPtr
    movl    $0, %edx
    cmpl    %eax,   %edx                #NULLCHECK. eax already has malloc's output
    je      label_memfailed

label_memfailed:
    movl    $msg_main_print_memFailed,  (%esp)
    call    puts
    movl    $-1,    (%esp)
    call    exit

#for11
    movl    $0, -16(%ebp)               #iCounter1 = 0
    jmp     label_for_11condition

label_for_11:
    movl    $4, %eax                    #sizeof(int*)
    movl    -8(%ebp),   %ecx            #iRows
    mull    %ecx                        #iRows*sizeof(int*) => answer in eax
    movl    %eax,   (%esp)              #malloc argument
    call    malloc                      #malloced memory address stored in eax
    movl    -28(%ebp),  %ebx            #base address of pppPtr
    movl    -16(%ebp),  %edx            #iCounter1
    movl    %eax,   (%ebx, %edx, 4)     #moving malloced address into pppPtr[iCounter1]
    movl    $0, %edx
    cmpl    %eax,   %edx
    je      label_memfailed

    #for12
    movl    $0, -20(%ebp)               #iCounter2=0
    jmp     label_for_12condition

    label_for_12:
        movl    $4, %eax                #sizeof(int)
        movl    -12(%ebx),  %ecx        #iColumns
        mull    %ecx                    #iColumns*sizeof(int) => answer in eax
        movl    %eax,   (%esp)          #malloc parameter
        call    malloc                  #malloc-ed address in eax
        movl    -28(%ebp),  %ebx        #base address of pppPtr
        movl    -16(%ebp),  %ecx        #iCounter1
        movl    (%ebx,  %ecx, 4), %ebx  #pppPtr[iCounter1]
        movl    -20(%ebp),  %ecx        #iCounter2
        movl    %eax, (%ebx,  %ecx, 4)  #malloced value stored in pppPtr[iCounter1][iCounter2]
        movl    $0, %edx
        cmpl    %eax,   %edx            #NULLCHECK
        je      label_memfailed

        #for13
        movl    $0, -24(%ebp)           #iCounter3=0
        jmp     label_for_13condition

        label_for_13:
            movl    -24(%ebp),  %eax
            movl    %eax,       12(%esp)    #iCounter3
            movl    -20(%ebp),  %eax
            movl    %eax,       8(%esp)     #iCounter2
            movl    -16(%ebp),  %eax
            movl    %eax,       4(%esp)     #iCounter1
            movl    $msg_main_print_enter_eachvalue,    (%esp) #printString
            call    printf

            movl    -28(%ebp),  %ebx        #base address of pppPtr
            movl    -16(%ebp),  %eax        #iCounter1
            movl    (%ebx, %eax, 4), %ebx   #pppPtr[iCounter1]'s base address
            movl    -20(%ebp),  %eax        #iCounter2
            movl    (%ebx, %eax, 4), %ebx   #pppPtr[iCounter1][iCounter2]'s base address
            movl    -24(%ebp),  %eax        #iCounter3
            leal    (%ebx, %eax, 4), %ebx   #&pppPtr[iCounter1][iCounter2][iCounter3]
            movl    %ebx,   4(%esp)         #scanf param 1
            movl    $msg_main_scan_each_value, (%esp)   #scanf param 2
            call    scanf
            addl    $1, -24(%ebp)           #iCounter3++
        label_for_13condition:
            movl    -12(%ebp),  %eax    #iColumns
            movl    -24(%ebp),  %edx    #iCounter3
            cmpl    %eax,   %edx
            jl      label_for_13

        addl    $1, -20(%ebp)           #iCounter2++
    label_for_12condition:
        movl    -8(%ebp),   %eax        #iRows
        movl    -20(%ebp),  %edx        #iCounter2
        cmpl    %eax,   %edx
        jl      label_for_12

    addl    $1, -16(%ebp)               #iCounter1++
label_for_11condition:
    movl    -4(%ebp),   %eax            #iPlanes
    movl    -16(%ebp),  %edx            #iCounter1
    cmpl    %eax,   %edx                
    jl      label_for_11


    pushl   $0
    call    exit
