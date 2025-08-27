.section    .rodata
    msg_main_print_floats:
    .string "fNo1 = %f\nfNo2 = %f\n"

    msg_main_print_ans1:
    .string "fAns1 = %f\t\n"

    msg_main_print_ans2:
    .string "fAns2 = %f\t\n"

    msg_main_print_ans3:
    .string "fAns3 = %f\t\n"

    int_5:
        .int 5

.section    .data
.globl  fNo1
.type   fNo1,   @object
.size   fNo1, 4
.align  4
fNo1:
    .float  10.22

.section    .data
.globl  fNo2
.type   fNo2,   @object
.size   fNo2, 4
.align  4
fNo2:
    .float  20.22

.section    .bss
.comm  fAns1, 4,  4
.comm  fAns2, 4,  4
.comm  fAns3, 4,  4

.section    .text
.globl  main
.type   main,   @function
main:
    addl    $-16,   %esp
    pushl   %ebp
    movl    %esp,   %ebp

    subl    $12,    %esp    #max params. 3 floats + 1 print
    subl    $4,    %esp     #alignment

    flds    fNo1            #st1
    flds    fNo2            #st0
    fstpl   12(%esp)
    fstpl   4(%esp)
    movl    $msg_main_print_floats, (%esp)
    call    printf

    flds    fNo2            #st0
    fsubs   fNo1
    fstps   fAns1

    flds    fNo1            #st0
    fsubs   fNo2
    fstps   fAns2

    flds    fNo1            #st0
    fild    int_5
    fstps   fAns3

    flds    fAns1           #st0
    fstpl   4(%esp)
    movl    $msg_main_print_ans1, (%esp)
    call    printf

    flds    fAns2           #st0
    fstpl   4(%esp)
    movl    $msg_main_print_ans2, (%esp)
    call    printf


    flds    fAns3           #st0
    fstpl   4(%esp)
    movl    $msg_main_print_ans3, (%esp)
    call    printf

    pushl   $0
    call    exit


