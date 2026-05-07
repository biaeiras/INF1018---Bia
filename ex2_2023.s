
.text 
.globl  boo 
    boo: 
    #RA
    pushq %rbp 
    movq %rsp, %rbp 
    subq $???, %rsp
    #SALVAR CALEE-SAVED
    
    
    
   
    movl $0, %r12d  #int acum = 0;
    movq %rdi, %r13  #s
    movl %esi, %r14d #n 


    WHILE: 
        #while (s)
        # 0 = false e 1 true
        cmpq $1, (%rdi)  #tá certo??
        jne SAI_DO_WHILE
        
        # n+acum
        addl %r14d, %esi 
        addl  %r12d , %esi 
       
        #ajustando os parametros
        movq $norma, %rdi 
     

        #certa(norma, n+acum);
        call cerca 

        movl %eax , 0(%r13)

        #acum += n;
        addl %r14d, %r12d 

        movq 8(%r13), %r13 


        jmp while

    SAI_DO_WHILE: 
        movl %r12d, %eax 
















