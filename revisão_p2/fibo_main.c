// #include <stdio.h> 
// //Só pode ter um simbolo de cada tipo 
// static int wrap(int n);
// // essa linha não gera simbolo 
// int fibo(int); 

// //gera simbolo T por que é função global 
// int main(void) {

//     //não gera simbolo - variale local não cria label 
//     int n = 5 ;
//     int res; 

//     //gera o simbolo de wrap t porque é local 
//     res = wrap(n);

//     //gera simbolo U 
//     printf("%d", res); 

//     return  0; 
// }

// //já gerou o simbolo na 15 
// static int  wrap (int n){
//     //gera U
//     return fibo(n);
// }


#include <stdio.h>

int fibo(int);
static int wrap(int n); // Protótipo adicionado aqui!

int main(void) {
    int n = 5;
    int res = wrap(n);
    printf("%d", res);
    return 0;
}

static int wrap (int n){
    return fibo(n);
}