#include <stdio.h>

int main()
{
    int iNo;
    int iCounter;

    printf("Enter number\n");
    scanf("%d", &iNo);

    for (iCounter = 1; iCounter < iNo; iCounter++)
    {
        if(iCounter%2 == 0) continue;
        printf("%d\n", iCounter);
    }
    
}