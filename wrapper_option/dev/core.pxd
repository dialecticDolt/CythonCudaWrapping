cdef extern from "simple.cu" nogil:
    cdef void addition(float *out, float *a, float *b, const int N);
