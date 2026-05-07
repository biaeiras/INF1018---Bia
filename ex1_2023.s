/*int acerta (int u[], int i)
{
return u[i];
}*/ 

.text 
.globl acerta
    acerta: 
       pushq %rbp 
       movq %rsp, %rbp 
       subq $8, %rsp 

       #SALVAR OS CALLEE SAVED 
       movq %r12, -8(%rbp)

       #indexação 
       #end base+ (i * 4)
       #trasnformar o valor de i para o registrador de 8 bytes 
       movslq %esi, %r12
       imulq $4, %r12
       addq %rdi, %r12 

       movl (%r12), %eax;

       #retornar valores 
       movq -8(%rbp), %r12

       leave 
       ret 

       

