A library for generating bindings to interface with Python via Python's C api

## Usage

A simple usage example:

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

With the following python code:
```python
def multiply(a,b):
    print("Will compute", a, "times", b)
    return a*b
```

## Lint issues?

Add the following to a build.yaml file in your project directory
```yaml
targets:
  $default:
    builders:
      source_gen|combining_builder:
        options:
          ignore_for_file: 
            - "type=lint"
``` 

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/TimWhiting/dartpy/issues/

"Python" is a registered trademark of the Python Software Foundation