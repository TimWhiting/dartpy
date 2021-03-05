#!/bin/bash
echo "
Running example 'dart dartpy_example.dart'
Should print out todays date
0 (exitcode)
---------------"
export PYTHONPATH=$PYTHONPATH:$PWD
dart dartpy_example.dart

