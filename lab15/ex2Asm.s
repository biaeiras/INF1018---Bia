/*float foo1 (float a, float b) {
  return sin(a) + b;
}*/ 

.text 

.globl foo1
    foo1: 

        #converter float para double 
        cvtss2sd %xmm0,%xmm0  #convertendo o a para double porque a função sin é double 

        call sin 

        #converter float para double 
        cvtss2sd %xmm1,%xmm1  #convertendo o a para double porque a função sin é double 

        #sin(a) + b
        addsd %xmm1, %xmm0  

        cvtsd2ss %xmm0, %xmm0  

        ret 