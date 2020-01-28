from libcpp.vector cimport vector
from libcpp.string cimport string

cdef extern from "simple.cu" nogil:
    cdef void addition_driver(float *out, float *a, float *b, const int N);
