/*
int nums[] = {10, -21, -30, 45};
int main() {
  int i, *p;
  int sum = 0;
  for (i = 0, p = nums; i != 4; i++, p++)
    sum += *p;
  printf("%d\n", sum);
  return 0;
}
*/

.data
nums:  .int  10, -21, -30, 45
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
/*usado movl porque é long e o int uiliza  bytes 32 bits ( 4bytes) */

movl $0, %ebx   /*contador i = 0 */    
movq $nums, %r12 /* ponteiro para o inicio da lista r12 = &nums*/
movl $0, %r13d  /*sum = 0*/ 
L1: 
	cmpl $4, %ebx  /* if (i ==4)*/
	je L2

movl  (%r12), %eax /* valor que está no endereço */ 
addl  %eax, %r13d
addl $1, %ebx 
addq $4, %r12 
jmp L1

L2: 
/*************************************************************/
/* este trecho imprime o valor de %eax (estraga %eax)  */
  movq    $Sf, %rdi    /* primeiro parametro (ponteiro)*/
  movl    %r13d, %esi   /* segundo parametro  (inteiro) VALOR DA SOMA */
  call  printf       /* chama a funcao da biblioteca */
/*************************************************************/


/***************************************************************/
/* mantenha este trecho aqui e nao mexa - finalizacao!!!!      */
  movq  $0, %rax  /* rax = 0  (valor de retorno) */
  movq  -8(%rbp), %rbx
  movq  -16(%rbp), %r12
  leave
  ret      
/***************************************************************/






	

