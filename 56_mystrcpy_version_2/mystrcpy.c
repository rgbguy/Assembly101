#include <stdio.h>
#include <string.h>

char* MYstrcpy(char* dest, char* src);

int main()
{
    char source[20];
    char destination[20];

    printf("\n\nEnter Source String:\t");
    gets(source);
    printf("\n\nSource String is:\t");
    puts(source);

    MYstrcpy(destination, source);
    printf("\n\nDestination String is:\t");
    puts(destination);

    return 0;
}

char* MYstrcpy(char* dest, char* src)
{
    char* result = dest;
    while(*src != '\0')
    {
        *dest = *src;
        src++;
        dest++;
    }
    *dest = '\0';
    

    return result;
}