#include <stdio.h>

int odd_ones(unsigned int x) {
  int contador = 0; 
  for(int i = 0; i < 32 ; i++){
    //no caso o 1 vai ficar por último ( dígito menos significante)
    if (x & 1){
      contador++; 
    }
    x = x>>1 ; 
  }

  return contador & 1; 
    
}
int main() {
  printf("%x tem numero %s de bits\n",0x01010101,odd_ones(0x01010101) ? "impar":"par");
  printf("%x tem numero %s de bits\n",0x01030101,odd_ones(0x01030101) ? "impar":"par");
  return 0;
}