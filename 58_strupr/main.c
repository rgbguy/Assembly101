#include <stdio.h>
#include <string.h>
int main()
{
    char *Mystrupr(char *str);

    char str[20];

    printf("\n\nEnter The String:\t");
    gets(str);

    Mystrupr(str);

    printf("\nString In Upper Case Is:\t");
    puts(str);

    return 0;
}

char *Mystrupr(char *str)
{

    while (*str != '\0')
    {
        *str -= 32;
        str++;
    }
}