#!/bin/bash
echo "
Running example 'dart dartpy_pycalldart.dart'
Should print out:
Will compute 1 times 2
Called from python
2
---------------"
export PYTHONPATH=$PYTHONPATH:$PWD
dart dartpy_pycalldart.dart

