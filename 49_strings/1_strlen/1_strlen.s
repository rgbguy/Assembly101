.section    .rodata
    msg_main_print_lengthofHello:
    .string "\nThe length of Hello is %d\n"

    msg_main_print_lengthofGood:
    .string "The length of Good is %d\n"

    msg_main_print_lengthMorning:
    .string "The length of Morning is %d\n"

.section    .text
.globl  main,   @function
main:
    pushl   %ebp
    movl    %esp,   %ebp

    

    pushl   $0
    call    exit