/*
int nums[] = {10, -21, -30, 45};
int main() {
  int i, *p;
  for (i = 0, p = nums; i != 4; i++, p++)
    if ((*p % 2) == 0)
      printf("%d\n", *p);
  return 0;
}
*/

/*int odd_ones(unsigned int x) {
  int contador = 0; 
  for(int i = 0; i < 32 ; i++){
    //no caso o 1 vai ficar por último ( dígito menos significante)
    if (x & 1){
      contador++; 
    }
    x = x>>1 ; 
  }

  return contador & 1; 
    
}*/

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
  movq    %r13, -24(%rbp)
/********************************************************/

movq $nums, %r12 
movl $0, %ebx 

L1: 
  cmpl $4, %ebx  /*i é igual a 4?*/ 
  je L2 

  movl (%r12), %r13d  /*pegando os valores da lista nums*/ 

  movl %r13d , %edx /*para não peder o valor original*/
  andl $1, %edx 
  jnz impar 

  /*************************************************************/
/* este trecho imprime o valor de %eax (estraga %eax)  */
  movq    $Sf, %rdi    /* primeiro parametro (ponteiro)*/
  movl    %r13d, %esi   /* segundo parametro  (inteiro) */
  call  printf       /* chama a funcao da biblioteca */
/*************************************************************/

impar : 
  addl $1, %ebx 
  addq $4,%r12
  jmp L1

L2: 

/***************************************************************/
/* mantenha este trecho aqui e nao mexa - finalizacao!!!!      */
  movq  $0, %rax  /* rax = 0  (valor de retorno) */
  movq    -24(%rbp), %r13
  movq  -8(%rbp), %rbx
  movq  -16(%rbp), %r12
  leave
  ret      
/***************************************************************/


