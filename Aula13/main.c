
//includes padrões
#include <stdio.h> 

#include <stdint.h>
#include <sys/mman.h>
#include <unistd.h>

#define PAGE_START(P) ((intptr_t)(P)&~(pagesize-1))
#define PAGE_END(P) (((intptr_t)(P)+pagesize-1)&~(pagesize-1))

/*
 * The execpage() function shall change the specified memory pages
 * permissions into executable.
 *
 * void *ptr  = pointer to start of memory buff
 * size_t len = memory buff size in bytes
 *
 * The function returns 0 if successful and -1 if any error is encountered.
 * errono may be used to diagnose the error.
 */
int execpage(void *ptr, size_t len) {
	int ret;

	const long pagesize = sysconf(_SC_PAGE_SIZE);
	if (pagesize == -1)
		return -1;

	ret = mprotect((void *)PAGE_START(ptr),
		 PAGE_END((intptr_t)ptr + len) - PAGE_START(ptr),
		 PROT_READ | PROT_WRITE | PROT_EXEC);
	if (ret == -1)
		return -1;

	return 0;
}

#undef PAGE_START
#undef PAGE_END

//meus includes 

//meus tipos
typedef int (*funcp) (int x);
//ponteiro para função, armazenando o endreço de uma função 
typedef unsigned int uint32; 


//minhas variaveisn locais 

// unsigned char codigo[] = {

//     0x55,                      //push   %rbp
//     0x48, 0x89, 0xe5 ,               //mov    %rsp,%rbp
//     0x48, 0x83, 0xec, 0x10 ,          //sub    $0x10,%rsp
//     0xff, 0xc7 ,                  //inc    %edi
//     0x89, 0xf8 ,                  //mov    %edi,%eax
//     0xc9 ,                     //leave
//     0xc3 ,                     //ret

// };

//add
// unsigned char codigo[] = {
//    0x55,                      //   %rbp
//    0x48, 0x89, 0xe5 ,             //  mov    %rsp,%rbp
//    0x48, 0x83, 0xec, 0x10 ,           // sub    $0x10,%rsp
//    0xe8, 0x00, 0x00, 0x00, 0x00,         // call   d <foo+0xd>
//    0xc9 ,                       //leave
//    0xc3                         // ret
// };

//mudança call para jmp - ERRO : LEAVE DPS DO JUMP
// unsigned char codigo[] = {
//     0x55,                      //   %rbp
//     0x48, 0x89, 0xe5,                //mov    %rsp,%rbp
//     0x48, 0x83, 0xec, 0x10,             //sub    $0x10,%rsp
//     0xe9, 0x00, 0x00, 0x00, 0x00,          //jmp    d <foo+0xd>
//     0xc9                      //leave
// };

unsigned char codigo[] = {
   0x55,                     //push   %rbp
   0x48, 0x89, 0xe5,               //mov    %rsp,%rbp
   0x48, 0x83, 0xec, 0x10,           // sub    $0x10,%rsp
   0xc9 ,                   // leave
   0xe9, 0x00, 0x00, 0x00, 0x00 ,         //jmp    e <foo+0xe>
   0xc3                      //ret

};
//minhas funções

int add(int x){
    return x+1;
};

int bar(int x){
    return x+1;

};

int main(void){
    int a; 
    int b; 
    funcp f; //ponteiro para função 

    execpage(codigo, sizeof(codigo)); 

    a = 7;
    b = bar(a); //chamada de função 
    printf("bar(%d) = %d\n", a ,b);

    f = bar; // não está chamando , função é o endereço 
    //referencia da função é o endereço da função 

    b = f(a) ; //chamando a função bar passando "a"

    printf("bar(%d) = %d\n", a,b);

    int offset ; 
    offset = (long)add - (long)(codigo + 14); 
    //para o compilador não reclamanr porque bar é um ponteiro e offset é  int 

    *(int *)(codigo+10) = offset; 

    //f = codigo; // mesma etapas em asm  e diferentes tipos , então não pode ser assim, tem que traduzir 

    f = (funcp) codigo; // se não dá erro, tem que fazer o typecasting 

    b = f(a);

    printf("add(%d) = %d\n", a,b);

    return 0;
}