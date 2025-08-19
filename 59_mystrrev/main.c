#include <stdio.h>
int main()
{
    char *Mystrrev(char *str);

    char string[20];

    printf("\n\nEnter The String:\t");
    gets(string);

    Mystrrev(string);

    printf("\n\nReverse String Is:\t");
    puts(string);

    return 0;
}

char *Mystrrev(char *str)
{
    int MYstrlen(const char *str);

    int length = MYstrlen((const char *)str);
    int n = 0;

    while (n < length / 2)
    {
        char temp = str[length - n - 1];
        str[length - n - 1] = str[n];
        str[n] = temp;
        n++;
    }
}

int MYstrlen(const char *str)
{
    if (str == NULL)
        return 0;

    int length = 0;
    while (*str != '\0')
    {
        str++;
        length++;
    }
    return length;
}
