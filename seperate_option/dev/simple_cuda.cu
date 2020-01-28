#include "simple.hpp"

__global__ void vector_add_cu(float *out, float *a, float *b, int n){
	for(int i = 0; i < n; i++){
		out[i] = a[i] + b[i];
	}
}

void addition(float *out, float *a, float *b, int N){
    
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
