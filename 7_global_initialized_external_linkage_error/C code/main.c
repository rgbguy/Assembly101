#include <stdio.h>
#include <stdlib.h>

void fun(void);
int g_iNo = 20;
int main(void)
{
    printf("In main %d\n", g_iNo);
    fun();
    exit(0);
}