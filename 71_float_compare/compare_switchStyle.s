.section    .rodata
    msg_main_enter_2floats:
    .string "Enter two floating point numbers:\t"

    msg_main_scan:
    .string "%f%f"

    msg_main_print_lessthan:
    .string "fNo1 is less than fNo2"

    msg_main_print_greaterthan:
    .string "fNo1 is greater than fNo2"

    msg_main_print_equal:
    .string "Values are equal"


.section    .text
.globl  main
.type   main,   @function
main:
    addl    $-16,   %esp
    pushl   %ebp
    movl    %esp,   %ebp

    subl    $12,    %esp    #local vars
    subl    $12,    %esp    #3 params maximum
    subl    $8,     %esp    #alignment

    movl    $msg_main_enter_2floats, (%esp)
    call    printf

    leal    -12(%ebp),   %eax
    movl    %eax,       8(%esp)
    leal    -8(%ebp),   %eax
    movl    %eax,       4(%esp)
    movl    $msg_main_scan, (%esp)
    call    scanf

    movl    -12(%ebp),   %eax
    movl    %eax,       4(%esp)
    movl    -8(%ebp),   %eax
    movl    %eax,       (%esp)
    call    Compare

    movl    %eax,   -4(%ebp)

    cmpl    $-1,    %eax
    jne     label_elseif
    movl    $msg_main_print_lessthan,   (%esp)
    call    puts
    jmp     label_out

    label_elseif:
    movl    -4(%ebp),   %eax
    cmpl    $1,    %eax
    jne     label_else
    movl    $msg_main_print_greaterthan,   (%esp)
    call    puts
    jmp     label_out

    label_else:
    movl    $msg_main_print_equal,   (%esp)
    call    puts

    label_out:
    pushl   $0
    call    exit


.section    .text
.globl  Compare
.type   Compare,   @function
Compare:
    pushl   %ebp
    movl    %esp,   %ebp

    #movl    8(%ebp),   %eax        #fNo1  #THIS DOESN'T WORK. Needs memory location
    #movl    12(%ebp),   %edx       #fNo2  #THIS DOESN'T WORK. Needs memory location
    flds    12(%ebp)
    flds    8(%ebp)

    fcompp  #compares st(0) with st(1) and pops two times and stores result in FPU's registers
    fstsw   #retrievs status register from FPU to ax (of eax)
            #stsw = status write / store status word. word = 2 byte
    sahf    #stores ah to flags (because ah has the compare part)
    
    ja      label_above
    jb      label_below
    movl    $0,     %eax
    jmp     label_compare_out

    label_above:
        movl    $1, %eax
        jmp     label_compare_out
s
    label_below:
        movl    $-1, %eax
        jmp     label_compare_out

    label_compare_out:
    movl    %ebp,   %esp
    popl    %ebp
    ret
