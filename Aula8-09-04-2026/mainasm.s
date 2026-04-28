  .data
  nums: .int 3, -5, 7, 8, -2
  s1:   .string "%d\n"

  .text
  .globl main
  main:
  /* prologo */
     pushq %rbp
     movq  %rsp, %rbp
     subq  $16, %rsp
     movq  %rbx, -8(%rbp)
     movq  %r12, -16(%rbp)

  /* coloque seu codigo aqui */

     movl $0, %ebx 
     movq $nums, %r12

    L1: 
        cmpl $5, %ebx 
        jge L2 
    
        movl (%r12), %edi  /* passando os valores para cada parâmetro */ 
        movl $1, %esi 
        call filtro 

        movq    $s1, %rdi    
        movl    %eax, %esi   
        call  printf      

        addl $1, %ebx 
        addq $4, %r12
        jmp L1

    L2: 
        movl $0, %eax  /*retorna 0 no final da função main*/ 
        
        /* finalizacao */
        movq -8(%rbp), %rbx
        movq -16(%rbp), %r12
        leave
        ret