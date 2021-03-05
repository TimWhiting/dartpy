A dart-ffi library allowing calls to Python®

## Usage

A simple usage example:

Darpy is a library that allows dart to call out to python code

For a simple python script inline you can do the following:
```dart
void main(List<String> args) {
 dartpyc.Py_Initialize();
 final python = '''
 from time import time, ctime
 print("Today is", ctime(time()))
 ''';
 final pystring = python.toNativeUtf8();
 dartpyc.PyRun_SimpleString(pystring.cast<Int8>());
 malloc.free(pystring);
 print(dartpyc.Py_FinalizeEx());
}
```

For a more complex script that you don't want inline you can do this:
```dart
void main() {
  // initializes the python runtime
  pyStart();
  try {
    // imports a python module
    final pyModule = pyimport('multiply');
    // gets a function within that module
    final pFunc = pyModule.getFunction('multiply');
    // calls the function and gets the result
    final result = pFunc([1, 2]);
    print(result); // Should print 3
  } on DartPyException catch (e) {
    print(e);
    // Cleans up memory
    pyCleanup();
    exit(1);
  }
  // Cleans up memory
  pyCleanup();
  exit(0);
}
```

Feel free to contribute! Not all objects are easily marshalled back and forth currently just supporting basic objects.

I'm working on an annotation and code generation library so that you can just annotate and call functions like so:
```dart
import 'package:dartpy/dartpy.dart';
import 'package:dartpy/dartpy_annotations.dart';
part 'gen_dartpy_example.g.dart';

@PyFunction(module: 'multiply')
int multiply(int a, int b) => pymultiply(a, b);

@PyFunction(module: 'multiply', name: 'multiply')
double mult_double(double a, double b) => pymultiplydouble(a, b);

@PyFunction(module: 'multiply', name: 'multiply')
num mult_num(num a, num b) => pymultiplynum(a, b);

void main() {
  try {
    print(multiply(6, 4));
    print(mult_double(6.13, 5.2));
    print(mult_num(6, 5.2));
    print(mult_num(6, 2));
  } on DartPyException catch (e) {
    if (pyErrOccurred()) {
      dartpyc.PyErr_Print();
    }
    print(e.message);
  }
}
```


"Python" is a registered trademark of the Python Software Foundation