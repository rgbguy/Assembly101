#include <stdio.h>
#include <stdlib.h>

struct demo{
    char chChar;
    int iNo;
    short int shiNo;
}obj1 = {'A', 10, 20};

int main(void)
{
    struct demo obj2;
    printf("Obj1 is \n");
    printf("chChar = %c, iNo = %d, shiNo = %hd\n\n", obj1.chChar, obj1.iNo, obj1.shiNo);

    printf("Obj2 is \n");
    printf("chChar = %c, iNo = %d, shiNo = %hd\n", obj2.chChar, obj2.iNo, obj2.shiNo);

    exit(0);
}