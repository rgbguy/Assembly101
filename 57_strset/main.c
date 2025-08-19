#include <stdio.h>
#include <string.h>
int main()
{
    char *Mystrset(char *str, char ch);

    char str[20], ch;

    printf("\n\nEnter The String:\t");
    gets(str);

    printf("\n\nEnter The Character To Set:\t");
    scanf("%c", &ch);

    Mystrset(str, ch);
    printf("\n\nNow String Is:\t");
    puts(str);

    return 0;
}

char *Mystrset(char *str, char ch)
{

    while (*str != '\0')
    {
        *str = ch;
        str++;
    }
}