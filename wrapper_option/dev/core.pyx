from core cimport *
import numpy as np
cimport numpy as np

import cython

@cython.boundscheck(False)
@cython.wraparound(False)
def add_vectors(a, b):
    cdef int N = len(a)
    
    assert(N == len(b))
    assert(isinstance(a, (np.ndarray, np.generic)))
    assert(isinstance(b, (np.ndarray, np.generic)))

    cdef float[:] c_a
    cdef float[:] c_b
    cdef float[:] c_out = np.zeros(N, dtype='float32')

    #cast to float
    c_a = np.asarray(a, dtype='float32')
    c_b = np.asarray(b, dtype='float32')

    #call out of c++ & cuda code
    addition_driver(&c_out[0], &c_a[0], &c_b[0], N)

    return np.asarray(c_out)
        
