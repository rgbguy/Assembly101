#include <stdio.h>
#include <string.h>

int main()
{
    int MYstrlen(const char* str);
    char *ptr  = "Hello";
    char str[] = "Good";

    printf("\nThe length of Hello is %d\n", MYstrlen(ptr));
    printf("The length of Good is %d\n", MYstrlen(str));
    printf("The length of Morning is %d\n", MYstrlen("Morning"));
    return 0;
}

int MYstrlen(const char* str)
{
    int length = 0;
    while(*str != '\0')
    {
        length++;
        str++;
    }
    return length;
}