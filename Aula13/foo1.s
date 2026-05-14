/*int foo (int x) {
  return x+1;
}*/

.text 

foo: 
.globl foo

    pushq %rbp 
    movq %rsp, %rbp 
    subq $16, %rsp 


    incl %edi 
    movl %edi, %eax 

    leave 

    ret 

