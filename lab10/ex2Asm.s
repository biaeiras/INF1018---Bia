/*int add2 (struct X *x) {
  if (x == NULL) return 0;
  else return x->val + add2(x->next);
}*/

/*
Dicionário
ebx    x->val
*/

.text 
.globl add2
    add2: 
        push %rbp 
        movq %rsp, %rbp
        sub $16, %rsp 

        #SALVAR CALLEE SAVED
        movq  %rbx, -8(%rbp)


        if: 
            /*compara para saber se x é null */ 
            cmpq $0, %rdi 
            je SAI_DO_IF
            
            /*salvando o valor de x->val em %ebx*/ 
            movl 0(%rdi), %ebx
            /*salvando o valor de x->next em %rdi (primeiro argumento de 64 bits)*/ 
            movq 8(%rdi), %rdi

            /*chama add2 passando %rdi */ 
            call add2

            /*eax retorna o valor do call e somo com o que já tem %r10d*/ 
            addl %eax, %ebx

            movl %ebx, %eax 

            jmp END

        
        SAI_DO_IF: 
            /* se for zero sai e retorna para função chamadora o valor 0*/ 
            movl $0, %eax 
        
        END: 
          #restaurar o valor dos callee- saved 
          movq -8(%rbp), %rbx

          movq    %rbp, %rsp  
          popq    %rbp    
          ret
           




        


