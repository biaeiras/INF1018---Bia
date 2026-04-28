/*void foo (int a[], int n) {
  int i;
  int s = 0;
  for (i=0; i<n; i++) {
    s += a[i];
    if (a[i] == 0) {
      a[i] = s;
      s = 0;
    }
  }
}*/ 

text
  .globl foo

    foo: 

        /* prologo */
        pushq %rbp
        movq  %rsp, %rbp
        subq  $16, %rsp
        movq  %rbx, -8(%rbp)
        movq  %r12, -16(%rbp)

        movl $0, %ebx /* valor de i */ 
        movl $0, %r12d  /* valor de s */ 

    
    L1: 

        cmpl %esi, %ebx 
        jge L2 
    
        movslq %ebx, %rcx 
        movl (%rdi, %rcx, 4), %eax 

        addl %eax, %r12d 

