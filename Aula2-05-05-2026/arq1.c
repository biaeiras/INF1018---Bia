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
  dump(&s, sizeof(s));

  printf("------------\n"); 
  
  long l = 1000;
  dump(&l, sizeof(l));
  printf("------------\n");
  
   printf("CHAR\n");
  
  char c = 'a';
  dump(&c, sizeof(c));
  printf("------------\n");
  char p[] = "7509";
  dump(p, sizeof(p));
  printf("------------\n");
  char q[] = 'A';
  dump(q, sizeof(q));

  printf("------------\n");
  char t[] = '';
  dump(t, sizeof(t));

  printf("------------\n");
  char u[] = '\n';
  dump(u, sizeof(u));

  printf("------------\n");
  char k[] = '$';
  dump(k, sizeof(k));

  return 0;
}