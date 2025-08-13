#include <stdio.h>
#include <string.h>

int main()
{
    char* MYstrcat(char* destination, const char* source);
    char source[20], destination[20];

    printf("\n\nEnter Destination String:\t");
    gets(destination);

    printf("\n\nEnter Source String:\t");
    gets(source);

    strcat(destination, source);

    printf("\n\nConcatenated String is:\t");
    puts(destination);

    return 0;
}

char* MYstrcat(char* destination, const char* source)
{
    char* result = destination;

    while(*destination != '\0') destination++;

    while(*source != '\0'){
        *destination = *source;
        source++;
        destination++;
    }

    *destination = '\0';

    return result;
}

