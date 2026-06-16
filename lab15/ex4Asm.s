/*double foo3 (double *a, int n) {
  int i;
  double r = 0.0;
  for (i=0; i<n; i++) {
    r += sin(*a);
    a++;
  }
  return r;
} */ 

.text 
.globl foo3 
    foo3: 
        #RA 

        pushq %rbp 
        movq %rsp, %rbp 
        subq $32, %rsp 

        movq %r12, -8(%rbp) 

        #double r = 0.0 
        pxor %xmm0, %xmm0 
        movsd %xmm0, -16(%rbp) 


        #n - salvando os calle saved 

        movq %r13 , -24(%rbp) 
        movl %esi, %r13d


        #a 
        movq %r14, -32(%rbp) 
        movq %rdi, %r14

        #while(i<n) 

        movl $0, %r12d

        FOR: 
            cmpl %r13d, %r12d
            jge SAI_FOR

            #passa (%rdi) no caso r14 para xmm0 
            movsd (%r14), %xmm0
            call sin 

            addsd %xmm0, -16(%rbp) 

            #adiciona a++ 
            addq $8, %r14

            #i++ 
            addl $1, r12d 

            jmp FOR

        SAI_FOR: 
            #restaurei os callee-saved 
            movq -8(%rbp), %r12 
            movq -24(%rbp), %r13
            movq -32(%rbp), %r14

            movsd -16(%rbp), %xmm0

            #destruo a RA
            leave
            ret







