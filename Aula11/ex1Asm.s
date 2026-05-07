/*int novonum(void) {
  int minhalocal;
  printf("numero: ");
  scanf("%d",&minhalocal);
  return minhalocal;
} */ 
.data
Sf:  .string "numero: "   
Sf2: .string "%d"   

.text 
.globl novonum
    novonum:
        pushq %rbp
        movq  %rsp, %rbp
        subq  $16, %rsp     
        
        #printf("numero: ");
        #organizar os valores para passar na função 
        movq $Sf, %rdi
        call printf

        #scanf("%d",&minhalocal); 
        movq $Sf2, %rdi
        leaq -4(%rbp), %rsi
        call scanf

        #return minhalocal;
        movl -4(%rbp), %eax 

        #não usou nenhum calee saved 

        #fecha ra e retorna 
        leave 
        ret 




