#include <stdio.h>
#include <stdlib.h>

void fun(void);

int main(void)
{
    extern int g_iNo;
    printf("In main %d\n", g_iNo);
    fun();
    exit(0);
}