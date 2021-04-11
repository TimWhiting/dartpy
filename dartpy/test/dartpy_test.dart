import 'package:dartpy/dartpy.dart';
import 'package:test/test.dart';

void main() {
  late DartPyModule mod;
  setUp(() {
    pyStart();
    mod = pyImport('dartpy_test');
  });
  test('Int', () {
    final func = mod.getFunction('int_test');
    expect(func([1, 2]), 3);
  });
  test('Double', () {
    final func = mod.getFunction('float_test');
    expect(func([1.0, 2.0]), 3.0);
  });
  test('Num', () {
    final func = mod.getFunction('num_test');
    expect(func([1.0, 2.0]), 3.0);
    expect(func([1, 2.0]), 3.0);
    expect(func([1.0, 2]), 3.0);
    expect(func([1, 2]), 3);
  });

  test('String', () {
    final func = mod.getFunction('string_test');
    expect(func(['Hello, ', 'World!']), 'Hello, World!');
  });

  test('Dynamic', () {
    final dyn = mod as dynamic;
    expect(dyn.int_test(1, 2), 3);
    expect(dyn.float_test(1, 2), 3);
    expect(dyn.num_test(1.0, 2.0), 3.0);
    expect(dyn.num_test(1, 2.0), 3.0);
    expect(dyn.num_test(1.0, 2), 3.0);
    expect(dyn.num_test(1, 2), 3);
    expect(dyn.string_test('Hello, ', 'World!'), 'Hello, World!');
  });
}
