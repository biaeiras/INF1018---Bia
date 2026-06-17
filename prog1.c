#include <stdio.h>
extern short s;
void f1(void) {
    // s--;
    printf ("teste");
}
void f2(void) {
    f1();
}