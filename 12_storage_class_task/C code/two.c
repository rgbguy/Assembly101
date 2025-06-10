#include <stdio.h>

static int iNo1; //global un-initialized internal linkage
static int iNo2 = 40; //global initialized internal linkage

static void fun2(); //global internal linkage

void fun1()
{
    printf("Enter number: ");
    scanf("%d", &iNo1);

    printf("In fun1, iNo1 is %d, iNo2 is %d\n", iNo1, iNo2);
    fun2();
}

static void fun2()
{
    printf("In static fun2\n");
}