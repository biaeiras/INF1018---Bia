/*#include <stdio.h>

int main (void) {
    for ( int i = 1; i <= 10; i++) {
        int valor = i * i; 
        printf("Quadrado: %d\n", valor);
    }
}*/ 

.data

Sf:  .string "%d\n"    # string de formato para printf

.text
.globl  main
main:
/********************************************************/
/* mantenha este trecho aqui e nao mexa - prologo !!!   */
    pushq   %rbp
    movq    %rsp, %rbp
    subq    $16, %rsp
    movq    %rbx, -8(%rbp)
    movq    %r12, -16(%rbp)
/********************************************************/

movl $1 , %ebx /* variavel i inicializada*/ 

L1: 
    cmpl $10 , %ebx 
    jg L2 

    movl %ebx, %eax
    imull  %eax, %eax

    movq    $Sf, %rdi    /* primeiro parametro (ponteiro)*/
    movl    %eax, %esi   /* segundo parametro  (inteiro) */
    call  printf       /* chama a funcao da biblioteca */

    addl $1, %ebx
    jmp  L1

L2: 
/***************************************************************/
/* mantenha este trecho aqui e nao mexa - finalizacao!!!!      */
  movq  $0, %rax  /* rax = 0  (valor de retorno) */
  movq  -8(%rbp), %rbx
  movq  -16(%rbp), %r12
  leave
  ret      
/***************************************************************/







