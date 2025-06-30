#include <stdio.h>

int main(void)
{
    int iNo;
    printf("Enter a number\n");
    scanf("%d", &iNo);

    if(iNo < 2)
    {
        printf("Number is less than 2\n");
    }
    else if(iNo > 2)
    {
        printf("Number is greater than 2\n");
    }
    else
    {
        printf("Number is 2\n");       
    }
}