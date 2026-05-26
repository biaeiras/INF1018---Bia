#include <stdio.h>
#include <math.h>

float foo1(float a, float b);

int main() {
    float r = foo1(1.0f, 2.0f);

    printf("%f\n", r);

    return 0;
}