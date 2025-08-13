#include<stdio.h>
#include<string.h>
int main()
{
    char* MYstrupr(char* str);
    char str[20];
    printf("\n\nEnter The String:\t");
    gets(str);
    MYstrupr(str);
    printf("\nString In Upper Case Is:\t");
    puts(str);
    return 0;
}

char* MYstrupr(char* str)
{
    char* result = str;
    while(*str != '\0')
    {
        *str = toupper(*str);
        str++;
    }

    return result;
}