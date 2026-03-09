#include <stdio.h>

void dump (void *p, int n) {
  unsigned char *p1 = p;
  while (n--) {
    printf("%p - %02x\n", p1, *p1);
    p1++;
  }

}

int main (void) {
  int i = 10000;
  dump(&i, sizeof(i));

  printf("------------\n"); 

  short s = 258;
  dump(&s, sizeof(i));
  printf("------------\n"); 
  long l = 1000;
  dump(&l, sizeof(l));
  printf("------------\n");
  char c = 'A';
  dump(&c, sizeof(c));

  return 0;
}