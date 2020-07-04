import 'package:ffi_tool/c.dart';

import 'type_aliases.dart';

const globals = [
  Global(name: 'Py_None', type: ppyObject),
  Global(name: 'PyFloat_Type', type: pyTypeObject),
  Global(name: 'PyComplex_Type', type: pyTypeObject),
  Global(name: 'PyCapsule_Type', type: pyTypeObject),
  Global(name: 'PyTuple_Type', type: pyTypeObject),
  Global(name: 'PyList_Type', type: pyTypeObject),
  Global(name: 'PyBytes_Type', type: pyTypeObject),
  Global(name: 'PyUnicode_Type', type: pyTypeObject),
  Global(name: 'PyDict_Type', type: pyTypeObject),
  Global(name: 'PyExc_TypeError', type: ppyObject),
  Global(name: 'PyExc_BaseException', type: ppyObject),
  Global(name: 'PyExc_Exception', type: ppyObject),
  Global(name: 'PyExc_ArithmeticError', type: ppyObject),
  Global(name: 'PyExc_FloatingPointError', type: ppyObject),
  Global(name: 'PyExc_OverflowError', type: ppyObject),
  Global(name: 'PyExc_ZeroDivisionError', type: ppyObject),
  Global(name: 'PyExc_AssertionError', type: ppyObject),
  Global(name: 'PyExc_OSError', type: ppyObject),
  Global(name: 'PyExc_IOError', type: ppyObject),
  Global(name: 'PyExc_ValueError', type: ppyObject),
  Global(name: 'PyExc_EOFError', type: ppyObject),
  Global(name: 'PyExc_MemoryError', type: ppyObject),
  Global(name: 'PyExc_IndexError', type: ppyObject),
  Global(name: 'PyExc_KeyError', type: ppyObject),
];
