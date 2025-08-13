#include<stdio.h>
#include<string.h>

int main()
{
    char* MYstrset(char* str, char ch);

    char str[20],ch;
    printf("\n\nEnter The String:\t");
    gets(str);
    printf("\n\nEnter The Character To Set:\t");
    scanf("%c",&ch);
    MYstrset(str,ch);
    printf("\n\nNow String Is:\t");
    puts(str);
    return 0;
}

char* MYstrset(char* str, char ch)
{
    char* result = str;
    while(*str != '\0')
    {
        *str = ch;
        str++;
    }

    return result;
}