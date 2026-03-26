#include <stdio.h> 

unsigned char switch_byte(unsigned char x){
    //1111 0000 em hexadecimal é 0xF0 e 0000 1111 é 0x0F
    unsigned char mascara_A =  x & 0xF0 ; 
    unsigned char mascara_B = x & 0x0F; 

    return ((mascara_A >> 4) | (mascara_B << 4));
}

unsigned char rotate_left(unsigned char x, int deslocamento){
   
    return ((x << 4) | (x >> (8-deslocamento)));
}

int main() {
  unsigned char resultado = switch_byte(0xAB); 
  printf("O resultado é 0x%02x \n", resultado); 
  unsigned char valor = 0x61; 
  printf("O rotate é 0x%02x \n", rotate_left(valor, 1)); 
  printf("O rotate é 0x%02x \n", rotate_left(valor, 2)); 
  printf("O rotate é 0x%02x \n", rotate_left(valor, 5)); 
  return 0;
}