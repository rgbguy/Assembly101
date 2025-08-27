.section    .rodata
    msg_main_print_floats:
    .string "fNo1 = %f\tfNo2 = %f\n"

    msg_main_print_double:
    .string "dNo1 = %lf\tdNo2 = %lf\n"

.section    .data
.globl  fNo1
.type   fNo1,   @object
.size   fNo1, 4
.align  4
fNo1:
    .float  57.33

.globl  dNo1
.type   dNo1,   @object
.size   dNo1, 8
.align  4
dNo1:
    .double  58963.546

.section    .bss
.comm  fNo2, 4,  4
.comm  dNo2, 8,  4

.section    .text
.globl  main
.type   main,   @function
main:
    addl    $-16,   %esp
    pushl   %ebp
    movl    %esp,   %ebp

    subl    $20,    %esp    #max params. 2 doubles + 1 print
    subl    $12,    %esp    #alignment

    flds    fNo1            #st1
    flds    fNo2            #st0
    fstpl   12(%esp)
    fstpl   4(%esp)
    movl    $msg_main_print_floats, (%esp)
    call    printf

    fldl    dNo1            #st1
    fldl    dNo2            #st0
    fstpl   12(%esp)
    fstpl   4(%esp)
    movl    $msg_main_print_double, (%esp)
    call    printf

    fldl    dNo1            #st0
    fstpl   dNo2            #copying to dNo1

    fldl    dNo1            #st1
    fldl    dNo2            #st0
    fstpl   12(%esp)
    fstpl   4(%esp)
    movl    $msg_main_print_double, (%esp)
    call    printf

    #flds    fNo1            #st0
    #fstps   fNo2            #copying to fNo2
    movl    fNo1,   %eax
    movl    %eax,   fNo2

    flds    fNo1            #st1
    flds    fNo2            #st0
    fstpl   12(%esp)
    fstpl   4(%esp)
    movl    $msg_main_print_floats, (%esp)
    call    printf

    pushl   $0
    call    exit


