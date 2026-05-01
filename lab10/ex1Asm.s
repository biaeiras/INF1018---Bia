/*struct X {
  int val;
  struct X *next;
};

int add (struct X *x) {
  int a = 0;
  for (; x != NULL; x = x->next)
    a += x->val;
  return a;
}*/ 

/*
Dicionário
ebx   a
*/

.text 
.global add
    add: 
        pushq %rbp
        movq  %rsp, %rbp
        subq   $16, %rsp   /*esse valor porque só usou o rbx que tem 8 bytes, mas precisa ser múltiplo de 16*/ 

        /*SALVAR OS VALORES CALLEE SAVED*/
        movq %rbx,-8(%rbp)

        #int a = 0;
        movl $0, %ebx

        #while(x != NULL)
        WHILE: 
            /* cmpq por que null é um ponteiro pro endereço vazio*/ 
            /* ponteiro tem 64 bits, 8 bytes, então o primeiro parâmetro é %rdi*/ 
            cmpq $0, %rdi 
            je SAI_DO_WHILE

            #a += x->val
            /*val é o primeiro da estrutura(0)*/ 
            addl 0(%rdi), %ebx 
            
            #x = x->next
            movq 8(%rdi), %rdi

            jmp WHILE
        
        SAI_DO_WHILE: 
         # passar o valor pra função chamadora 
         movl %ebx, %eax
         #restaurar os callee saved 
            movq -8(%rbp), %rbx

            movq    %rbp, %rsp  
            popq    %rbp    
            ret
        

        