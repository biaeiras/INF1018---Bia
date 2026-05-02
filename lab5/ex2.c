#include <stdio.h>

void dump (void *p, int n); 

struct X {
  int a;
  short b;
  int c;
} ; 

int main(){
    struct X x = {0xa1a2a3a4, 0xb1b2, 0xc1c2c3c4};

    printf ("struct: \n");
    dump (&x, sizeof(struct X));

    return 0 ; 
}