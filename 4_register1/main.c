#include <stdio.h>

int main(void)
{
    register int iNo1 = 10;
    register int iNo2 = 20;
    register int iNo3 = 30;
    register int iNo4 = 40;
    register int iNo5 = 50;
    register int iNo6 = 60;
    register int iNo7 = 70;

    printf("%d %d %d %d %d %d %d\n", iNo1, iNo2, iNo3, iNo4, iNo5, iNo6, iNo7);
    return 0;
}