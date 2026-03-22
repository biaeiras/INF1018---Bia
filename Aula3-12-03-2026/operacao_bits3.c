#include <stdio.h> 

unsigned char switch_byte(unsigned char x){
    //1111 0000 em hexadecimal é 0xF0 e 0000 1111 é 0x0F
    unsigned char mascara_A =  x & 0xF0 ; 
    unsigned char mascara_B = x & 0x0F; 

    return ((mascara_A >> 4) | (mascara_B << 4));
}

int main() {
  unsigned char resultado = switch_byte(0xAB); 
  printf("O resultado é 0x%02x \n", resultado); 
  return 0;
}