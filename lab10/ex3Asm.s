/* #include <stdio.h>

struct X {
  int val1;
  int val2;
};

int f(int i, int v);

void boo (struct X *px, int n, int val) {
  while (n--) {
    px->val2 = f(px->val1, val);
    px++;
  }
} */ 

/*
Dicionário

*/

.text
.globl boo 
    boo: 
        push %rbp 
        movq %rsp, %rbp
        sub $32, %rsp

        #salavr valores callee-saved 
        movq  %r12, -8(%rbp)
        movq  %r13, -16(%rbp)
        movq  %r14, -24(%rbp)

        #guardando os valores originais dos paramêtros

        movq  %rdi, %r12         
        movl  %esi, %r13d        
        movl  %edx, %r14d   


    WHILE: 
        cmpl $0, %r13d 
        je SAI_DO_WHILE
        decl %r13d

        #preparando os paramêtros
        #f(px->val1, val)
        movl 0(%r12), %edi
        movl %r14d, %esi 

        call f

        # px->val2 = f(px->val1, val);

        movl %eax, 4(%r12)

        addq $8, %r12 

        jmp WHILE
    
    SAI_DO_WHILE:

        #restaurar os valores
        movq -8(%rbp), %r12
        movq -16(%rbp), %r13
        movq -24(%rbp), %r14

        movq    %rbp, %rsp  
        popq    %rbp    
        ret
    





