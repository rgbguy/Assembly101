#include <stdio.h>
int g_iNo;
void fun(void)
{
    printf("In fun giNo = %d, &giNo = %d\n", g_iNo, &g_iNo);
}