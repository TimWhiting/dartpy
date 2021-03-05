#!/bin/bash
echo "
Running example 'dart dartpy_embedding.dart multiply multiply 1 2'
Should print out args,
Will compute 1 times 2
2
---------------"
export PYTHONPATH=$PYTHONPATH:$PWD
dart dartpy_embedding.dart multiply multiply 1 2

