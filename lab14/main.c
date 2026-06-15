#include <stdio.h>
#include <math.h>

#define getsig(x)        ((x)>>31 & 1)
#define getexp(x)        ((x)>>23 & 0xff)
#define getfrac(x)       ((x) & 0x7fffff)
#define makefloat(s,e,f) ((s & 1)<<31 | (((e) & 0xff) << 23) | ((f) & 0x7fffff))

typedef union {
  float f;
  unsigned int i;
} U;

float float2(float f){

    U u;
    float f1 = f;

    u.f = f1;  /* armazena o float na union */
    unsigned u1 = u.i;  /* obtem a representação "manipulavel" do float */

    u.i = u1;  /* armazena a representação binária na union */
    f1 = u.f;  /* obtem o float correspondente a essa representação */

    // agora pode chamar os macros 

    // (x * 2^y )* 2 ^1 = x + 2^ y + 1


    //Caso especial 

    if (u.i == 0)
      return f;

    unsigned int exp = getexp(u1); 

    exp = exp + 1;


    unsigned int sinal = getsig(u1); 

    unsigned int mantissa = getfrac(u1);

    u.i = makefloat(sinal, exp , mantissa); 

    return u.f ; 


}

float int2float(int i){

  //(-1)s M 2E

  //Trate o 0 como um caso especial (sua conversão é imediata).

  if (i == 0){
    return 0.0;
  }

  //verificando se meu número é negativo ou positivo ( o que vai representar o s)
  unsigned int s; 
  unsigned int abs_i; 
  
  if (i < 0){

    s = 1; //é negativo 
    abs_i= (unsigned int)-i; // a questão falou que se fosse negativo trabalhar com o valor positivo

  } else{
    s = 0; // é positivo 
    abs_i= (unsigned int)i;
  }

  //A mantissa tem a 1.frac 

  int E = 0; 

  int x = abs_i; 
  //chegar no valor mais significativo, em que o indice vai ser o valor de E
  while(x > 1) {
    x = x >> 1; 
    E++;
  }

  unsigned int exp = E + 127; 

  //montar a fração 

  unsigned int mascara = (1<< E) - 1; 
  //por que se por exemplo for 1101, eu quero a frac 101 pra isso eu posso crar uma máscara 0111, então eu sei que para tirar 1 que não faz parte da fração eu preciso ter 0 na máscara no começo, se eu ando 1 para esquerda na quantidade do Expoente chego o tamanho que a máscara que preciso dps subtraio 1 trcando os valores da máscara chegando exatamente em 0 no valor mais significativo e 1 nos outros

  unsigned int frac = abs_i & mascara ; 

  
  if( E <= 23){
     frac = frac << (23 - E);

  }else{
     frac = frac >> (E-23);
  }

  U u; 

  u.i = makefloat(s,exp,frac); 

  return u.f; 

}

int main() {
   int i;

   printf("\n******** int2float ****************\n");
   i = 0;
   printf(" %d -> %+10.4f\n", i, int2float(i));
   i = 1;  
   printf(" %d -> %+10.4f\n", i, int2float(i));
   i = -1;  
   printf(" %d -> %10.4f\n", i, int2float(i));
   i = 0x7fffffff;  
   printf(" %d -> %+10.4f\n", i, int2float(i));
   i = -i;
   printf(" %d -> %+10.4f\n", i, int2float(i));
   i = 12345;
   printf(" %d -> %+10.4f\n", i, int2float(i));
   i = -12345;
   printf(" %d -> %+10.4f\n", i, int2float(i));
   return 0;
}