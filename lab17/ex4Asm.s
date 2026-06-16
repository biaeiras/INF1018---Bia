/*dicionario 
  int i - r12d 
  double acc - -8(%rbp)
  int n - r13d
  px - r14


*/ 

.text 
.globl pack1
    pack1:
        #MONTAR RA
        pushq %rbp 
        movq %rsp, %rbp 
        subq $32, %rsp 



        #guardando acc na pilha pra não perder no call 
    
        pxor %xmm1, %xmm1
        movsd %xmm1, -8(%rbp)

        #guardando called- saved 

        movq %r12, -16(%rbp)
        movq %r13, -24(%rbp)
        movq %r14, -32(%rbp)
        movq %rbx, -40(%rbp)

        #i = 0 
        movl $0, %r12d
        #n
        movl %esi , %r13d

        #guardar o valor de px 
        
        movq %rdi, %r14



    

        #while(i< n) 
        WHILE: 
        
            #comparação 
            cmpl %r13d, %r12d
            jge FORA_WHILE
            
            #preparar os parâmetros para passar pra o call 
                #px[i] -> endereço base + (i *4)
            #aumentar o tamanho de i 
            
            movslq %r12d, %rax
            
            imull $8, %eax

            movq %r14, %rbx 
            
            addq %rax, %rbx

            
            #px[i].vf 
            movss 4(%rbx), %xmm0 

            #px[i].vi
            
            movsd 0(%bx), %esi
            
            
            #converter float para double

            cvtss2sd %xmm0, %xmm0 

            call foo 

            addsd %xmm0, -8(%rbp)
            
                #i++
            addl $1, %r12d

             jmp WHILE

        FORA_WHILE: 

            movsd -8(%rbp), %xmm0 

            #restaurar os valores dos caleed-saved 

            movq -16(%rbp), %r12
            movq -24(%rbp), %r13
            movq -32(%rbp), %r14
            movq -40(%rbp), %rbx

            
            #fechar RA

            leave 
            ret 
        
        
    

        
