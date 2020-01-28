#include<stdio.h>

__global__ void vector_add_cu(float *out, float *a, float *b, int n){
	for(int i = 0; i < n; i++){
		out[i] = a[i] + b[i];
	}
}

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

void addition_driver(float *out, float *a, float *b, int N){
    
    float *d_a, *d_b, *d_out;    

    cudaMalloc((void**)&d_a, sizeof(float)*N);
    cudaMalloc((void**)&d_b, sizeof(float)*N);
    cudaMalloc((void**)&d_out, sizeof(float)*N);

    cudaMemcpy(d_a, a, sizeof(float)*N, cudaMemcpyHostToDevice);
    cudaMemcpy(d_b, b, sizeof(float)*N, cudaMemcpyHostToDevice);

    vector_add_cu<<<1, 1>>>(d_out, d_a, d_b, N);

    cudaMemcpy(out, d_out, sizeof(float)*N, cudaMemcpyDeviceToHost);

    cudaFree(d_a);
    cudaFree(d_b);
    cudaFree(d_out);
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

    addition_driver(out, a, b, N);

    vector_print(out, N);

    free(a);
    free(b);
    free(out);
}

