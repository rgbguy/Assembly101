#include <stdio.h>
#include <stdlib.h>

void fun(void);

int main(void)
{
    int g_iNo;
    printf("In main giNo = %d, &giNo = %d\n", g_iNo, &g_iNo);
    fun();
    exit(0);
}