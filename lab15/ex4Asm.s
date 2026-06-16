/*double foo3 (double *a, int n) {
  int i;
  double r = 0.0;
  for (i=0; i<n; i++) {
    r += sin(*a);
    a++;
  }
  return r;
} */ 


/*Dicionário  

  i = ebx 



*/ 
.text 

.globl foo3 
    foo3: 
     # double *a é ponteiro e primeiro argumento então está em rdi 
     # int n primeiro arg int %edi 

     pushq %rbp 
     movq %rsp, %rbp 
     subq ???, %rsp

     movq %rbx, -8(%rbp)  #vai ser i 
    
     #movsd $0, -16(%rbp)  #valor de r ( não pode fazer isso)

     pxor %xmm0, xmm0 #zerando o valor 
     movsd %xmm0, -16(%rbp)

     movq %r12, -24(%rbp)  #valor de n 

     #i = 0 
     movl $0, %ebx 

     #while (i < n)

     FOR:
        cmpl %r12d, %ebx
        jge FORA_FOR

        #r += sin(*a);

        #para não perder o valor de *a

        movq (%rdi), %r13

        movq %r13, %xmm0

        call sin 

        addsd %xmm0, -16(%rbp)

        #a++ 

        #i++
        addl $1, %ebx

    FORA_FOR: 
        movs %xmm1, %xmm0
        ret





