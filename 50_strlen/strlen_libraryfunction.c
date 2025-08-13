#include <stdio.h>
#include <string.h>

int main()
{
    char* ptr = "Hello";
    char str[] = "Good";

    printf("\nThe length Of Hello Is %zu\n", strlen(ptr));
    printf("The length of good is %zu\n", strlen(str));
    printf("The length of Morning is %zu\n", strlen("Morning"));

    return 0;
}