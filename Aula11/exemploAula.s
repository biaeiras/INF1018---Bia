/* long l ; 
   printf("%ld", l); 
   scanf("%ld", &l); 

*/ 

movq $SF1, %rdi 
movq  -8(%rbp), %rsi 
call printf

movq $SF1, %rdi
leaq -8(%rbp) #a diferen;a do movq é que ele vai lá e pega o endereço 


#se precisar de endereço tem que colocar na RA