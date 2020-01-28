from libcpp.vector cimport vector
from libcpp.string cimport string

cdef extern from "simple.hpp" nogil:
    cdef void addition(float *out, float *a, float *b, const int N);
