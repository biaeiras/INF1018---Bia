.text
.globl foo
    foo:
        movl $0, %eax 
        subl %edi, %eax
        cvtsi2sd %eax, %xmm1
        mulsd %xmm1, %xmm0

        ret 