/*int conta_impares(int *vetor, int n) {
    int i, total = 0;
    for (i = 0; i < n; i++) {
        if (eh_impar(vetor[i])) // eh_impar retorna 1 se for impar
            total++;
    }
    return total;*/ 

.text 
.globl conta_impares 
    conta_impares: 
    #RA
    pushq  %rbp 
    movq %rsp, %rbp 
    subq $16 %rsp //LEMBRANDO QUE O PUSH JÁ FEZ 8 O QUE DSALINHOU ENTÃO TEM QUE TER PELO MENOS 8 


    #SALVAR CALLEE SAVED 
    movq %r12 ,-8(%rbp) 
    movq %r13, -16(%rbp)

    #int i, total = 0;
    movl $0 , %r12d  #total = 0 
    movl $0, %r13d  #i = 0 

  


    WHILE: 
        #for (i = 0; i < n; i++)
        #while( i<n)
        cmpl %r13d, %esi 
        jge SAI_DO_WHILE

        #vetor[i]
        movslq %r13d, %r13 #aco que nem precisa né pq vai guardar na parte maior
        imull $4, %r13

        #enderço base + (i *4)
        addl %r13, %rdi 

        call  eh_impar 

        #if (eh_impar(vetor[i]))
    
        IF:

            cmpl $1, %eax
            jne SAI_DO_if
            #total++;
            addl $1, %r12d
        
        SAI_DO_if: 
            addl $1, %r13d 
        
        SAI_DO_WHILE: 
            movl %r12d, %eax 

            #retornar os valores do calee-saved 
            movq -8(%rbp), %r12d  
            movq -16(%rbp), %r13d

            #fechar RA
            leave 
            ret 













