#include <stdio.h>

int main(void)
{
    long long int iNumerator;
    int iDenominator;
    int iQuotient;
    int iRemainder;

	printf("Enter Numerator:\t");
	scanf("%qd", &iNumerator);


	printf("Enter Denominator:\t");
	scanf("%d", &iDenominator);

    iQuotient = iNumerator / iDenominator;
    iRemainder = iNumerator % iDenominator;

	printf("Quotient is: %d\n", iQuotient);
	printf("Remainder is: %d\n", iRemainder);

}