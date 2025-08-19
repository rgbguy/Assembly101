#include <stdio.h>
#include <string.h>

int main()
{
    char *MYstrcat(char *dest, char *src);

    char source[20], destination[40];

    printf("\n\nEnter Destination String:\t");
    gets(destination);

    printf("\n\nEnter Source String:\t");
    gets(source);

    MYstrcat(destination, source);
    printf("\n\nConcatenated String Is:\t");

    puts(destination);

    return 0;
}

char *MYstrcat(char *dest, char *src)
{
    char *result = dest;
    // reach till end of dest
    while (*dest != '\0')
    {
        dest++;
    }

    while (*src != '\0')
    {
        *dest = *src;
        dest++;
        src++;
    }

    return result;
}