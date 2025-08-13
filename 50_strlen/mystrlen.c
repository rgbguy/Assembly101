#include <stdio.h>
#include <string.h>

int MYstrlen(const char *str);

int main()
{
    char* ptr = "Hello";
    char str[] = "Good";

    printf("Printing string: %s", ptr);
    printf("Printing string: %s", str);

    printf("\nThe length Of Hello Is %d\n", MYstrlen(ptr));
    printf("The length of good is %d\n",  MYstrlen(str));
    printf("The length of Morning is %d\n",  MYstrlen("Morning"));

    return 0;
}

int MYstrlen(const char *str)
{
    if(str == NULL) return 0;

    int length = 0;
    while(*str != '\0')
    {
        str++;
        length++;
    }
    return length;
}
