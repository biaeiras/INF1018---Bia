/*int bemboba (int num) {
  int local[4];
  int *a;
  int i;

  for (i=0,a=local;i<4;i++) {
    *a = num;
    a++;
  }
  return addl (local, 4);
} */ 

.text 
.globl bemboba
    bemboba: 
        pushq %rbp
        movq  %rsp, %rbp
        subq  $48, %rsp

        movq  %r12, -8(%rbp); # variavel a que é um ponteiro 
        movq  %r13, -16(%rbp);  # variavel i
        movq  %r14, -24(%rbp);  # variavel num 

        movl $0, %r13d # i = 0 
        movl %edi, %r14d #num 
        leaq -48(%rbp), %r12 
        
        
        #for (i=0,a=local;i<4;i++) 
        #while(i< 4)

        FOR: 
            cmpl $4 , %r13d 
            jge SAI_DO_FOR

            #*a = num; 

            movl %r14d, (%r12)

            #a++; 
            addq $4, %r12
            addl $1, %r13d

            jmp FOR
        
        SAI_DO_FOR: 
            #return addl (local, 4);
            #chama addl (local, 4);
            leaq -48(%rbp), %rdi 
            movl  $4, %esi 
            call addl

            movq  -8(%rbp), %r12 # variavel "a" que é um ponteiro 
            movq  -16(%rbp), %r13  # variavel i
            movq  -24(%rbp),  %r14  # variavel num 

            leave 
            ret






        

