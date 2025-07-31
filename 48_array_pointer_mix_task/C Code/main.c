#include <stdio.h>
#include <stdlib.h>

int main()
{
    int arr[] = {10, 20, 30, 40, 50};
    int *p[] = {arr, arr + 1, arr + 2, arr + 3, arr + 4};
    int **ptr = p;

    printf("arr = %-25p \t *arr = %-25d \t &arr = %-25p\n", arr, *arr, &arr);
    printf("p = %-25p \t *p = %-25p \t **p = %-25d\n", p, *p, **p);
    printf("prt = %-25p \t *ptr = %-25p \t **ptr = %-25d\n", ptr, *ptr, **ptr);

    *ptr++;
    printf("ptr - p = %d \t *ptr - arr = %d \t **ptr = %d\n", ptr - p, *ptr - arr, **ptr);

    *++ptr;
    printf("ptr - p = %d \t *ptr - arr = %d \t **ptr = %d\n", ptr - p, *ptr - arr, **ptr);

    ++*ptr;
    printf("ptr - p = %d \t *ptr - arr = %d \t **ptr = %d\n", ptr - p, *ptr - arr, **ptr);

    exit(0);
} 