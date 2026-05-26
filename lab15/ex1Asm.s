
/*float foo (double a, float b) {
  return (a+b)*(a-b);
}*/

.text 

foo: 
.globl foo

    #converter float para double 
    cvtss2sd %xmm1,%xmm1

    #(a+b)
    addsd %xmm1, %xmm2  #guardando o valor em xmm2 porque vai usar o valor de a em xmm0

    #(a-b)

    subsd %xmm1 , %xmm0 

    #(a+b)*(a-b); 

    mulsd %xmm2, %xmm0

    cvtsd2ss %xmm0, %xmm0  

    ret 
