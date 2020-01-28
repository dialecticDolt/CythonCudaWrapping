
all: simple

simple: simple_cuda.o
	g++ -o program -L$(TACC_CUDA_LIB) -L$(TACC_CUDA_LIB)/stubs/ -lcuda -lcudart simple.cpp simple_cuda.o

simple_cuda.o:
	nvcc -shared -c simple_cuda.cu -Xcompiler -fPIC

clean: 
	rm -f *.o simple
