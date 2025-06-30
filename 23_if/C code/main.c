#include <stdio.h>

int main(void)
{
    int iNo;
    printf("Enter a number\n");
    scanf("%d", &iNo);

    if(iNo%2 == 0)
    {
        printf("Number is even\n");
    }
}