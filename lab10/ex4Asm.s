/* #include <stdio.h>

int f(int x);

void map2 (int* um, int * outro, int n) {
  int i;
  for (i=0; i<n; i++)
    *(outro+i) = f(*(um+i));
}
*/ 

.text
.globl map2 
    map2: 
        push %rbp 
        movq %rsp, %rbp
        subq $32, %rsp

        /*SALVAR CALEE- SAVED*/ 

        movl $0, %ecx 

        WHILE: 
            cmpl %edx, %ecx 
            jge SAI_DO_WHILE

            # f(*(um+i));
            # aux = i
            movl %ecx , %r8d 
            
            # aux += um 
            
            imulq $4, %r8 
            addq %rdi, %r8

            /* guardando porque vai precisar dos resultados depois*/ 
            movq  %rdi, -8(%rbp)
            movq  %rsi, -16(%rbp)
            movl  %edx, -20(%rbp)
            movl  %ecx, -24(%rbp)

            /*é um ponteiro *aux */ 
            movl (%r8), %edi

            /*chama a função*/ 

            call f

            /*restaurando */ 
            movq    -8(%rbp), %rdi
            movq    -16(%rbp), %rsi
            movl    -20(%rbp), %edx
            movl    -24(%rbp), %ecx


            #*(outro+i) 
            #mesmo porcesso que o anterior

            #aux2 = outro + i
            #aux2 = i 

            movl %ecx, %r8d 

            #aux2 += outro 

             
            imulq $4, %r8 
            addq %rsi, %r8

            movl %eax, (%r8)

            incl %ecx

            jmp WHILE
        
        SAI_DO_WHILE: 
            movq    %rbp, %rsp  
            popq    %rbp    
            ret





