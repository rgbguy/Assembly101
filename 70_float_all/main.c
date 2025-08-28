#include <stdio.h>

float fAns;

int main()
{
    //fAns = ((43.65/22) + (76.34 * 3.1));
    fAns = ((12.43*6) - (140.2/94.21));
    //fAns = ((43.65/22) + (76.34 * 3.1)) / ((12.43*6) - (140.2/94.21));

    printf("%f\n", fAns);
    return 0;
}    
    // flds    f_94.21
    // fdivs   f_140.2
    // #fstps   fAns

    // fild    i_6
    // fmuls   f_12.43
    // fstps   fAns

        fild    i_22                 
    flds    f_43.65               
    fdivp    %st(0), %st(1)

    flds    f_76.34             
    flds    f_3.1              
    fmulp    %st(0), %st(1)

    faddp   %st(0), %st(1)