#include <stdio.h>
#include <string.h>

int main()
{
    char* MYstrcpy(char* destination, const char* source);

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


char* MYstrcpy(char* destination, const char* source)
{
    char* result = destination;
    while(*source != '\0')
    {
        *destination = *source;
        destination++;
        source++;
    }
    return result;
}