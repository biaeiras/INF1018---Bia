#include <ctype.h>
#include <stdio.h>

int string2num (char *s) {
  int a = 0;
  for (; *s; s++)
    a = a*10 + (*s - '0');
  return a;
}

int string2num2 (char *s, int base) {
  int a = 0;
  for (; *s; s++)
    a = a*base + (*s - '0');
  return a;
}

int string2num3 (char *s, int base) {
  int a = 0;
  for (; *s; s++){
    int digit;
    if(isdigit(*s)){

        digit = *s - '0';
    }
    else{
        digit = *s - 'a' + 10 ;

    }
    a = a * base + digit; 

  }
  return a;
}

int main (void) {
  printf("==> %d\n", string2num("1234"));
  printf("==> %d\n", string2num("1234") + 1);
  printf("==> %d\n", string2num("1234") + string2num("1"));


  printf("==> %d\n", string2num2("777", 8));

  printf("==> %d\n", string2num3("z09b", 36));


  return 0;
}