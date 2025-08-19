#include <stdio.h>
#include <string.h>
int main()
{
    char *MYstrncat(char *dest, char *src, int n);
    char source[20], destination[40];
    int n;

    printf("\n\nEnter Destination String:\t");
    gets(destination);

    printf("\n\nEnter Source String:\t");
    gets(source);

    printf("\n\nEnter Value Of n:\t");
    scanf("%d", &n);

    MYstrncat(destination, source, n);

    printf("\n\nConcatenated String Is:\t");
    puts(destination);
    return 0;
}

char *MYstrncat(char *dest, char *src, int n)
{
    char *result = dest;
    // reach till end of dest
    while (*dest != '\0')
    {
        dest++;
    }

    while (n > 0)
    {
        *dest = *src;
        dest++;
        src++;
        n--;
    }

    return result;
}