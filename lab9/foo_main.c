#include <stdio.h> 

void foo(int a[], int n);

int main(){
    int v[] = {1, 2, 0, 4, 5, 0, 1};
    int n = 7 ;

    foo(v, n); 

    printf("Array depois da chamada:\n");
    for (int i = 0; i < n; i++) {
        printf("%d ", v[i]);
    }
    printf("\n");

    return 0; 
}