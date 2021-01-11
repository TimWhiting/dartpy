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
