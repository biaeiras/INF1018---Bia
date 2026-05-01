/*void foo (int a[], int n) {
  int i;
  int s = 0;
  for (i=0; i<n; i++) {
    s += a[i];
    if (a[i] == 0) {
      a[i] = s;
      s = 0;
    }
  }
}*/ 

/*
Dicionário

%ebx - i 
%r12d - n

*/

.text
  .globl foo

    foo: 

        /* prologo */
        pushq %rbp
        movq  %rsp, %rbp
        subq  $32, %rsp   
        
        #SALVAR CALLEE-SAVED 
        movq %rbx, -8(%rbp)
        movq %r12, -16(%rbp)

        movl $0, %ebx /* valor de i */ 
        movl $0, %r12d  /* valor de s */ 


    #for (i=0; i<n; i++)
    #while(i<n)
    
    WHILE: 
        #valor de n está no esi porque é segundo argumento e é um inteiro (4 bytes)
        cmpl %esi, %ebx    #comparando se i == n 
        jge SAI_DO_WHILE

        #a[i]; 

        movslq %ebx, %rax
        imulq $4, %rax
        #indexação  endereço base + (i *4)
        addq %rdi, %rax 

        #s += a[i]; 
        addl (%rax), %r12d 

        #if (a[i] == 0) 
        cmpl  $0, (%rax)
        jne SAI_DO_IF

        #a[i] = s
        movl %r12d, (%rax) 

        #s = 0;
        movl $0, %r12d 
    
      SAI_DO_IF: 
        addl $1, %ebx 
        jmp WHILE
    
    SAI_DO_WHILE : 

      #restaurar os registradores callee-saved 
        movq -8(%rbp), %rbx
        movq -16(%rbp), %r12

      #destruir a RA
        movq    %rbp, %rsp  
        popq    %rbp    
        ret



