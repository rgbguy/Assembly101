#include <stdio.h>

int main(void)
{
    int iNo1, iNo2, iNo3;
    int iAns;

    printf("Enter 3 numbers\n");
    scanf("%d %d %d", &iNo1, &iNo2, &iNo3);

    iAns = iNo1 && ++iNo2 && ++iNo3;
    printf("%d %d %d %d\n", iNo1, iNo2, iNo3, iAns);
}