

/*int nums[4] = {65, -105, 111, 34};

int main (void) {
  int i;
  int s = 0;

  for (i=0;i<4;i++)
    s = s+nums[i];

  printf ("soma = %d\n", s);

  return 0;
}*/

.data
Sf:  .string "%d\n" 
nums:	.int	65, -105, 111, 34 
.text
.globl  main
main:

/********************************************************/
/* mantenha este trecho aqui e nao mexa - prologo !!!   */
  pushq   %rbp
  movq    %rsp, %rbp
  subq    $16, %rsp
  movq    %rbx, -8(%rbp)  /* guarda rbx */
  movq    %r12, -16(%rbp)  /* guarda r12 */
/********************************************************/

movl $0, %ebx /* i = 0*/ 
movl $0, %r12d /* s = 0 */ 
L1: 
  cmpl $4, %ebx 
  jg L2

  movslq %ebx, %rcx 
  imulq $4, %rcx 
  addq $nums, %rcx 

  movl (%rcx), %eax
  addl %eax, %r12d

  addl $1, %ebx 
  jmp L1
L2: 

  movq    $Sf, %rdi    /* primeiro parametro (ponteiro)*/
  movl    %r12d, %esi   /* segundo parametro  (inteiro) */
  call  printf       /* chama a funcao da biblioteca */

/***************************************************************/
/* mantenha este trecho aqui e nao mexa - finalizacao!!!!      */
  movq  $0, %rax  /* rax = 0  (valor de retorno) */
  movq  -8(%rbp), %rbx
  movq  -16(%rbp), %r12
  leave
  ret      
/***************************************************************/

