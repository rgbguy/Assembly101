#include <stdio.h>

void fun();

int main(void)
{
    for (int i = 0; i < 5; i++)
    {
        fun();
    }
}

void fun()
{
    static int iNo = 10;
    printf("In fun %d\n", iNo);
    iNo++;
}