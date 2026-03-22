#include <stdio.h>
int main(void) {
  unsigned int x = 0x87654321;
  unsigned int y, z;

  /* o byte menos significativo de x e os outros bits em 0 */
  unsigned int mascara = 0x000000FF;
  y = x & mascara;
  
  /* o byte mais significativo com todos os bits em '1' 
     e os outros bytes com o mesmo valor dos bytes de x */
  unsigned int mascara2 = 0xFF000000;
  z = x | mascara2;

  printf("%08x %08x\n", y, z);
}