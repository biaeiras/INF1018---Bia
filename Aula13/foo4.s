/*int add (int x) {
  return x+1;
}
}*/

.text 

foo: 
.globl foo

    pushq %rbp 
    movq %rsp, %rbp 
    subq $16, %rsp 

    jmp add

    leave 

    ret 

