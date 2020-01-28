# CythonCudaWrapping
Two minimal examples of how to wrap CUDA code with Cython

## Seperate Option
This folder demonstrates assembling the CUDA code into object files and then linking against them when compiling Cython. 

## Wrapper Option
This folder demonstrates compiling everything together using the `nvcc_wrapper` from Sandia's KOKKOS project. This is liscensed so we may want to avoid this route even though its a bit simpler in implementation. 
