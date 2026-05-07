/*int eh_par(int x);
int boo(int *v, int n) {
 int i, pares = 0;
 for (i = 0; i < n; i++) {
 if (eh_par(v[i]))
 pares++;
 }
 return pares;
}*/ 


.text 
.globl boo 
    boo: 
    #Abrir RA 
    pushq %rbp 
    movq %rsp, %rbp 
    subq %16,  %rsp 

    #SALVAR CALEE-SAVED 
    movq %r12, -8(%rbp); 
    movq %r13,  -16(%rbp); 

    # int i, pares = 0;
    movl $0, %r12d #i = 0
    movl $0, %r13d  # pares =0 

    #for (i = 0; i < n; i++)
    #while(i<n)

    WHILE:
    #n é inteiro e o segundo parâmetro %esi 
    cmpl %r12d, %esi 
    # o contrário de i<n é maior E igual !!!
    jge SAI_DO_WHILE

    #if (eh_par(v[i])) 
    #v[i] 
    #transformar i em 4 pra bytes 
    movslq %r12d, %r14
    imull $4, %r14

    #endereço base + (i * 4)
    addl %rdi, %r14

    #ajustar os parâmetros 
    movl (%r14), %rdi 

    # if 
    cmpl $0, %r14
    je SAI_DO_IF


    call eh_par
    addl $1, %r13d 

    SAI_DO_IF 
    addl $1, %r12d 

    SAI_DO_WHILE
        #como retorna pares 
        movl %r13d, %eax

        #reornr os vaores originais dos calee-saved 
        movq -8(%rbp) , %r12; 
        movq -16(%rbp), %r13; 

        leave 
        ret 

    
















