#include <stdio.h>
#include <stdlib.h>

void fun(void);
int g_iNo;

int main(void)
{
    printf("In main giNo = %d, &giNo = %d\n", g_iNo, &g_iNo);
    fun();
    exit(0);
}