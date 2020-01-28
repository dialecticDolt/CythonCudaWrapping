from setuptools import setup, find_packages
from setuptools.extension import Extension
from Cython.Build import cythonize
import numpy.distutils.misc_util
import sys, os
import numpy as np

#Check if Cython is installed
try:
    from Cython.Distutils import build_ext
except:
    print("You don't seem to have Cython installed")
    sys.exit(1)

os.environ["CC"] = 'nvcc_wrapper'
os.environ["CXX"] = 'nvcc_wrapper'

#include directories
inc_dirs = []
inc_dirs = inc_dirs + [np.get_include()]

#library directories
lib_dirs = []


def scandir(dir, files=[]):
    for file in os.listdir(dir):
        path = os.path.join(dir, file)
        if os.path.isfile(path) and path.endswith(".pyx"):
            files.append(path.replace(os.path.sep, ".")[:-4])
        elif os.path.isdir(path):
            scandir(path, files)
    return files

def makeExtension(extName):
    extPath = extName.replace(".", os.path.sep)+".pyx"
    return Extension(
        extName,
        [extPath],
        include_dirs = inc_dirs,
        language='c++',
        library_dirs = lib_dirs,
        runtime_library_dirs = lib_dirs,
        extra_compile_args=["-std=c++11","-O3", "-Wno-sign-compare", "--expt-extended-lambda", "-Xcudafe","--diag_suppress=esa_on_defaulted_function_ignored"],
        extra_link_args=["-Wl,--no-as-needed", "-Wl,--verbose", "-ldl", "-lpthread"]
    )

extNames = scandir("cuda_wrapper")
print(extNames)
extensions = [makeExtension(name) for name in extNames]
print(extensions)

setup(
    name="cuda_wrapper",
    packages=["cuda_wrapper"],
    ext_modules=extensions,
    package_data={
        '':['*.pxd']
    },
    zip_safe=False,
    include_package_data=True,
    cmdclass = {'build_ext': build_ext}
    )
