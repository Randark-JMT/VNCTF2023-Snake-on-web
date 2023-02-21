#include <stdio.h>
#include <stdlib.h>
int main()
{
    int score = 5;
    int delta = 5;
    for (int i = 0; i < 100; i++)
    {
        int tmp = score % 5 + 1;
        score += tmp;
        delta += (tmp - 1);
        printf("score=%3d  delta=%3d  subtraction=%d\n", score, delta, score - delta);
    }
    return 0;
}