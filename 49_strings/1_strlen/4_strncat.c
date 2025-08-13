#include<stdio.h>
#include<string.h>
int main()
{
    char* MYstrncat(char* destination, const char* source, int n);

    char source[20],destination[40];
    int n;
    printf("\n\nEnter Destination String:\t");
    gets(destination);
    printf("\n\nEnter Source String:\t");
    gets(source);
    printf("\n\nEnter Value Of n:\t");
    scanf("%d",&n);
    MYstrncat(destination,source,n);
    printf("\n\nConcatenated String Is:\t");
    puts(destination);
    return 0;
}

char* MYstrncat(char* destination, const char* source, int n)
{
    char* result = destination;
    int count = 0;
    while(*destination != '\0') destination++;

    while(*source != '\0' && count < n){
        *destination = *source;
        source++;
        destination++;
        count++;
    }

    *destination = '\0';

    return result;
}