#!/bin/bash

rm -rf cuda_wrapper

cp -R dev cuda_wrapper

python setup.py build_ext --inplace
