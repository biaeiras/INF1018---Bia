/*double foo2 (float a, float b) {
  return sin(a) + cos(b);
}*/

.text 

.globl foo2
    foo2: 

        #converter float para double 
        cvtss2sd %xmm0,%xmm0  #convertendo o a para double porque a função sin é double 

        call sin 

        movsd %xmm0, %xmm2 

        #converter float para double 
        cvtss2sd %xmm1,%xmm1  #convertendo o a para double porque a função sin é double 

        movsd %xmm1, %xmm0 

        call cos

        #sin(a) + cos(b)
        addsd %xmm2, %xmm0  


        ret 