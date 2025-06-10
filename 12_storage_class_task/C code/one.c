#include <stdio.h>
#include <stdlib.h>

int iNo1 = 10; //global initialized external linkage
int iNo2; //global un-initialized external linkage

void fun1(); //global external linkage

int main()
{
    int iNo3;

    printf("Enter two numbers: ");
    scanf("%d %d", &iNo2, &iNo3);

    printf("In main, %d %d %d\n", iNo1, iNo2, iNo3);

    fun1();

    exit(0);
}