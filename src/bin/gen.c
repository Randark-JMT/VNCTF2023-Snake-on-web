#include <stdio.h>
int main()
{
    char a[] = "aabbccflagccbbaa";
    char b[] = "sfaceratrebumverodolorindolortakimataverou";
    int c[43];
    for (int i = 0; i < 43; i++)
    {
        c[i] = a[i] - b[i];
        c[i] ^= 114;
        c[i] += 5;
        c[i] ^= 514;
    }
    for (int i = 0; i < 43; i++)
    {
        printf("%d", c[i]);
        if (i != 42)
        {
            printf(",");
        }
    }
    printf("\n");
    return 0;
}