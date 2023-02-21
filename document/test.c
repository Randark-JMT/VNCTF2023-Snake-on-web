#include <stdio.h>
#include <stdlib.h>
int main()
{
    int score = 101;
    printf("%d\n", score % 10);
    printf("%d\n", score % 9);
    printf("%d\n", score % 7);
    printf("%d\n", score % 3);
    for (int i = 0; i < 200; i++)
    {
        if (i % 10 == 0 && i % 9 == 1 && i % 7 == 2 && i % 3 == 1)
        {
            printf("%d", i);
        }
    }
}