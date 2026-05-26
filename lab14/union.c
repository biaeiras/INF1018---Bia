typedef union { 
  float f;
  unsigned int i;
 } U;
...
U u;
float f1 = ...;
unsigned int u1;

u.f = f1;  /* armazena o float na union */
u1 = u.i;  /* obtem a representação "manipulavel" do float */

...
u.i = u1;  /* armazena a representação binária na union */
f1 = u.f;  /* obtem o float correspondente a essa representação */

