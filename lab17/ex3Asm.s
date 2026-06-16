.text 
.globl pack 
    pack: 
        #MONTAR RA
        pushq %rbp 
        movq %rsp, %rbp 
        subq $16, %rsp 

        #se eu colocar double acc n familia xmm eu ia perder na chamada do call, por isso coloquei na pilha
        pxor %xmm1, %xmm1 
        movsd %xmm1, -8(%rbp) 

        #salvar rdi em r12 pq se não vou perder no call
        movq %r12, -16(%rbp)
        movq %rdi , %r12

        #WHILE(px != NULL) 
        WHILE:
            cmpq $0, %r12
            je SAI_WHILE

            # acc += foo(px->vd, px->vi);

            #Ajustar parâmetros 

            movsd 8(%r12), %xmm0 
            movl   0(%r12), %edi 

            call foo 

            addsd %xmm0, -8(%rbp) 

            #px = px->next; 

            movq 16(%rbp), %r12

            jmp WHILE

        SAI_WHILE: 
            movsd -8(%rbp), %xmm0 

            #restaurar callee - saved 
            movq -16(%rbp), %r12 	

            #fechar RA
            leave
            ret 



