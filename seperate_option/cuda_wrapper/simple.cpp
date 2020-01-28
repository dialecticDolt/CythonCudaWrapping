#include<stdio.h>
#include<cstdlib>

#include "simple.hpp"

void vector_add(float *out, float *a, float *b, int n) {
    for(int i = 0; i < n; i++){
        out[i] = a[i] + b[i];
    }
}

void vector_print(float *in, int n){
    for(int i = 0; i < n; i++){
        printf("%.6f, ", in[i]);
    }
}

int main(){
    float *a, *b, *out; 
    const int N = 100;

    // Allocate memory
    a   = (float*)malloc(sizeof(float) * N);
    b   = (float*)malloc(sizeof(float) * N);
    out = (float*)malloc(sizeof(float) * N);

    // Initialize array
    for(int i = 0; i < N; i++){
        a[i] = 1.0f; b[i] = 2.0f;
    }

    addition(out, a, b, N);

    vector_print(out, N);

    free(a);
    free(b);
    free(out);
}

