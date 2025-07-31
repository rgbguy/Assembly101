.section .rodata
    msg_main_printf1:
    .string "arr = %-25p \t *arr = %-25d \t &arr = %-25p\n"

    msg_main_printf2:
    .string "p = %-25p \t *p = %-25p \t **p = %-25d\n"

    msg_main_printf3:
    .string "prt = %-25p \t *ptr = %-25p \t **ptr = %-25d\n"

    msg_main_printf4:
    .string "ptr - p = %d \t *ptr - arr = %d \t **ptr = %d\n"

.section .text
.globl  main
.type   main,   @function
main:
    pushl   %ebp
    movl    %esp,   %ebp

#int arr[] = {10, 20, 30, 40, 50};
    subl   $20,    %esp
    movl   $10,    -20(%ebp)
    movl   $20,    -16(%ebp)
    movl   $30,    -12(%ebp)
    movl   $40,    -8(%ebp)
    movl   $50,    -4(%ebp)

#int *p[] = {arr, arr + 1, arr + 2, arr + 3, arr + 4};
    subl    $20,    %esp
    movl    $0,     %eax
    leal    -20(%ebp, %eax, 4), %ebx
    movl    %ebx,   -40(%ebp)
    movl    $1,     %eax
    leal    -20(%ebp, %eax, 4), %ebx
    movl    %ebx,    -36(%ebp)
    movl    $2,     %eax
    leal    -20(%ebp, %eax, 4),  %ebx
    movl    %ebx,    -32(%ebp)
    movl    $3,     %eax
    leal    -20(%ebp, %eax, 4),  %ebx
    movl    %ebx,    -28(%ebp)
    movl    $4,     %eax
    leal    -20(%ebp, %eax, 4),  %ebx
    movl    %ebx,    -24(%ebp)

#int **ptr = p;
    subl    $4,     %esp
    movl    $0,     %eax
    leal    -40(%ebp),  %ebx
    movl    %ebx,    -44(%ebp)

#printf("arr = %-10d \t *arr = %-10d \t &arr = %-10d\n", arr, *arr, &arr);
    leal    -20(%ebp),  %ebx
    pushl   %ebx
    movl    $0, %eax
    movl    -20(%ebp, %eax, 4), %eax
    pushl   %eax
    leal    -20(%ebp),  %ebx
    pushl   %ebx
    pushl   $msg_main_printf1
    call    printf
    addl    $16,    %esp

#printf("p = %-10d \t *p = %-10d \t **p = %-10d\n", p, *p, **p);
    leal    -40(%ebp),  %eax        #adress of p array
    movl    (%eax),   %eax          #value at p[0] i.e. arr
    pushl   (%eax)
    leal    -40(%ebp),  %eax
    pushl   (%eax)
    leal    -40(%ebp),  %eax        #adress of p array
    pushl   %eax
    pushl   $msg_main_printf2
    call    printf
    addl    $16,    %esp

#printf("prt = %-10d \t *ptr = %-10d \t **ptr = %-10d\n", ptr, *ptr, **ptr);
    movl    -44(%ebp),  %eax
    movl    (%eax),   %eax
    pushl   (%eax)
    movl    -44(%ebp),  %eax
    pushl   (%eax)
    pushl    -44(%ebp)              #ptr
    pushl   $msg_main_printf3
    call    printf
    addl    $16,    %esp

    addl    $4, -44(%ebp)           #ptr++
#printf("ptr - p = %d \t *ptr - arr = %d \t **ptr = %d\n", ptr - p, *ptr - arr, **ptr);
    movl    -44(%ebp),  %eax
    movl    (%eax),   %eax
    pushl   (%eax)
    movl    -44(%ebp),  %eax        
    movl   (%eax),   %eax           #*ptr
    leal    -20(%ebp),  %ebx        #arr
    subl    %ebx,   %eax
    movl    $4, %ecx
    divl    %ecx
    pushl   %eax
    movl    -44(%ebp),  %eax        #ptr      
    leal    -40(%ebp),  %ebx        #adress of p array
    subl    %ebx,   %eax
    movl    $4, %ecx
    divl    %ecx
    pushl   %eax
    pushl   $msg_main_printf4
    call    printf
    addl    $16,    %esp

    addl    $4, -44(%ebp)           #++ptr
#printf("ptr - p = %d \t *ptr - arr = %d \t **ptr = %d\n", ptr - p, *ptr - arr, **ptr);
    movl    -44(%ebp),  %eax
    movl    (%eax),   %eax
    pushl   (%eax)
    movl    -44(%ebp),  %eax        
    movl   (%eax),   %eax           #*ptr
    leal    -20(%ebp),  %ebx        #arr
    subl    %ebx,   %eax
    movl    $4, %ecx
    divl    %ecx
    pushl   %eax
    movl    -44(%ebp),  %eax        #ptr      
    leal    -40(%ebp),  %ebx        #adress of p array
    subl    %ebx,   %eax
    movl    $4, %ecx
    divl    %ecx
    pushl   %eax
    pushl   $msg_main_printf4
    call    printf
    addl    $16,    %esp

    movl    -44(%ebp),  %eax        #moving value in ptr into eax, now eax has address of p
    addl    $4, (%eax)              #incrementing the dereferenced value and storing it back
#printf("ptr - p = %d \t *ptr - arr = %d \t **ptr = %d\n", ptr - p, *ptr - arr, **ptr);
    movl    -44(%ebp),  %eax
    movl    (%eax),   %eax
    pushl   (%eax)
    movl    -44(%ebp),  %eax        
    movl   (%eax),   %eax           #*ptr
    leal    -20(%ebp),  %ebx        #arr
    subl    %ebx,   %eax
    movl    $4, %ecx
    divl    %ecx
    pushl   %eax
    movl    -44(%ebp),  %eax        #ptr      
    leal    -40(%ebp),  %ebx        #adress of p array
    subl    %ebx,   %eax
    movl    $4, %ecx
    divl    %ecx
    pushl   %eax
    pushl   $msg_main_printf4
    call    printf
    addl    $16,    %esp

    pushl   $0
    call    exit

