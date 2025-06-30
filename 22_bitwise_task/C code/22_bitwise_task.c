#include <stdio.h>

int main(void)
{
    int iNo1;
    int iNo2;

    printf("Enter 2 numbers\n");
    scanf("%d %d", &iNo1, &iNo2);

    printf("~iNo1: %d\n", ~iNo1);
    printf("~iNo2: %d\n", ~iNo2);
    printf("AND: %d\n", iNo1 & iNo2);
    printf("OR: %d\n", iNo1 | iNo2);
    printf("XOR: %d\n", iNo1 ^ iNo2);
    printf("LeftShift iNo1: %d\n", iNo1 << 1);
    printf("RightShift iNo2: %d\n", iNo2 >> 1);
}