/*int fat (int n) {
  if (n==0) return 1;
  else return n*fat(n-1);
}*/ 


  .text
  .globl fat

    fat: 

        /* prologo */
        pushq %rbp
        movq  %rsp, %rbp
        subq  $16, %rsp
        movq  %rbx, -8(%rbp)
       

        movl %edi, %ebx  /* gurando o valor de n*/ 

        cmpl $0, %ebx 
        jne Recursivo 
        /* caso base*/ 
        movl $1, %eax 
        jmp final 

    
    Recursivo: 

        movl %ebx, %edi /* passando o parametro*/ 

        decl %edi 
        call fat 

        imull %ebx, %eax 
    
      
    final : 

        /* finalizacao */
        movq -8(%rbp), %rbx
        leave
        ret

