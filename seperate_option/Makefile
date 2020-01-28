


all: simple

simple: dev/simple_cuda.o
	./build.sh

dev/simple_cuda.o: 
	nvcc -shared -c dev/simple_cuda.cu -o dev/simple_cuda.o -Xcompiler -fPIC

clean:
	rm -f dev/*.o
	rm -rf cuda_wrapper
