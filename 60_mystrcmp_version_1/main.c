#include <stdio.h>
#include <string.h>
int main()
{
    int MYstrcmp(char *string1, char *string2);

    char string1[20], string2[20];
    int ch;
    printf("\n\nEnter String1:\t");
    gets(string1);
    printf("\n\nEnter String2:\t");
    gets(string2);
    ch = MYstrcmp(string1, string2);
    if (ch == 0)
        printf("\n\nBoth Strings Are Same\n");
    else
        printf("\n\nBoth Strings Are Diffrent\n");
    return 0;
}

int MYstrcmp(char *string1, char *string2)
{
    while (*string1 || *string2)
    {
        if (*string1 != *string2)
        {
            return *string1 - *string2;
        }
        string1++;
        string2++;
    }
    return 0;
}