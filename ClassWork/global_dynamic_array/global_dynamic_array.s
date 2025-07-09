.equ    MAX,    10

.section    .rodata
    msg_main_print_entervalueofn:
    .string "Enter value of n:\t"

    msg_main_scan:
    .string "%d"

    msg_main_memFailed:
    .string "Memory allocation FAILED"

    msg_main_print_Entervalue:
    .string "Enter %d value:\t"

    msg_main_print_EnteredElementsAre:
    .string "Entered elements are:\n"

    msg_main_print_value_is:
    .string "%d value is:\t%d\n"

.section    .data
.globl  pPtr
.type   pPtr,  @object
.size   pPtr,  4
.align  4
pPtr:
    .int    0

.section    .text
.globl      main
.type       main,   @function
main:
    pushl   %ebp
    movl    %esp,   %ebp

    subl    $8, %esp

    pushl   $msg_main_print_entervalueofn
    call    printf
    addl    $4, %esp

    leal    -4(%ebp),   %eax
    pushl   %eax
    pushl   $msg_main_scan
    call    scanf
    addl    $8,     %esp

    movl    $4, %eax
    movl    -4(%ebp),   %ecx
    mull    %ecx                #result comes in edx:eax
    pushl   %eax
    call    malloc              #result will be stored in EAX (every function does it) #malloc returns adress of starting memory of allocation
    movl    %eax,   pPtr
    addl    $4, %esp

    movl    $0,     %eax
    movl    pPtr,   %edx
    cmpl    %edx,   %eax
    jne     label_memory_allocation_passed

    pushl   $msg_main_memFailed
    call    puts
    addl    $4, %esp
    
    pushl   $-1
    call    exit
    addl    $4, %esp

label_memory_allocation_passed:
    #for 1 starts
    movl    $0, -8(%ebp)
    jmp     label_for1_condition

label_for1_loop:
    pushl   %edx                #iCounter already present in edx
    pushl   $msg_main_print_Entervalue
    call    printf
    addl    $8, %esp

    movl    -8(%ebp),   %eax
    leal    pPtr(,%eax,4),  %edx
    pushl   %edx
    pushl   $msg_main_scan
    call    scanf
    addl    $8, %esp

    addl    $1, -8(%ebp)

label_for1_condition:
    movl    -4(%ebp),   %eax    #iMax
    movl    -8(%ebp),   %edx    #iCounter
    cmpl    %eax,   %edx
    jl      label_for1_loop

    pushl   $msg_main_print_EnteredElementsAre
    call    printf
    addl    $4, %esp

    #for 2 starts
    movl    $0, -8(%ebp)
    jmp     label_for2_condition

label_for2_loop:
    pushl   pPtr(, %edx, 4)
    pushl   %edx                        #iCounter already present in edx
    pushl   $msg_main_print_value_is
    call    printf
    addl    $12, %esp

    addl    $1, -8(%ebp)

label_for2_condition:
    movl    -4(%ebp),   %eax    #iMax
    movl    -8(%ebp),   %edx    #iCounter
    cmpl    %eax,   %edx
    jl      label_for2_loop
    #for 2 ends

    movl    pPtr, %eax
    pushl   %eax
    call    free
    addl    $4, %esp

    pushl   $0
    call    exit
