#include<stdio.h>
int main()
{
    char* MYstrrev(char* str);
    char string[20];
    printf("\n\nEnter The String:\t");
    gets(string);
    MYstrrev(string);
    printf("\n\nReverse String Is:\t");
    puts(string);
    return 0;
}


char* MYstrrev(char* str)
{
    if (str == NULL) return NULL;

    char* start = str;
    char* end = str;

    while (*end != '\0') 
    {
        end++;
    }
    end--;

    while (start < end) 
    {
        char temp = *start;
        *start = *end;
        *end = temp;

        start++;
        end--;
    }

    return str;
}
