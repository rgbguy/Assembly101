#include <stdio.h>

int g_iNo;

int main(void)
{
	printf("%p\n", (void*)&g_iNo);
	printf("%d\n", g_iNo);
	return 0;
}
