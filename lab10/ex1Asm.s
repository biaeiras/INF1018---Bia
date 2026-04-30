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
        pushq %rbd
        movq  %rsp, %rbp
        subq   $16, p   /*VOLTAR SALVANDO O VALOR*/ 

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
         #restaurar os callee saved 

         # remover o RA
            movq    %rbp, %rsp  # destroi o RA
            popq    %rbp    # restaura a base do RA da chamadora

            # retornar
            ret
        

        