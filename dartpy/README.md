## Usage

Dartpy is a library that allows dart to call out to python code
by using the [Python C-API embedding](https://docs.python.org/3/c-api/index.html#c-api-index) and `dart:ffi`.
As such it is a fairly low level interface where you have to manage reference counts of python objects to help the python garbage collector.

However, there are a few high level functions that I've provided to automatically marshal the arguments to python and back and manage the reference counts for you.

Here are a few examples:

For a simple python script inline you can do the following:
(Uses the low level C-API that is wrapped by `dart:ffi`).
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
(Uses a few higher level helper methods)
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

Feel free to contribute! This is a best effort project that I develop in my spare time. 

### Limitations

This library assumes that you have the python dynamic library in the following locations:
- (MacOS) /usr/local/Frameworks/Python.framework/Versions/3.8/lib/libpython3.8.dylib
- (Linux) /usr/lib/x86_64-linux-gnu/libpython3.8.so
- (Windows) -- I don't know the default location, please submit a pull request!

To override this default location, put the following at the beginning of your script:
```dart
void main() {
  pyLibLocation = '/path/to/your/dynamic_library';
  // The rest of your code...
}
```
Eventually, maybe I will create a flutter package that bundles the dynamic library in the assets for each of the platforms, but currently I'm not doing that.

Not all objects are automatically marshalled back and forth, currently just supporting basic objects (int, double, String, num).

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
