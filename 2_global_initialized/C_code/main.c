#include <stdio.h>

int g_iNo = 10;

int main(void)
{
	printf("%p\n", (void*)&g_iNo);
	printf("%d\n", g_iNo);
	return 0;
}
