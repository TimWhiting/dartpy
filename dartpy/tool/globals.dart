// import 'package:ffi_tool/c.dart';

// import 'structs.dart';
// import 'type_aliases.dart';

// const globals = [
//   /// https://docs.python.org/3/c-api/exceptions.html
//   /// All standard Python exceptions are available as global variables whose names are PyExc_ followed by the Python exception name. These have the type PyObject*; they are all class objects. For completeness, here are all the variables:
//   // TODO: More exception classes
//   Global(name: 'PyExc_BaseException', type: pPyObject),
//   Global(name: 'PyExc_Exception', type: pPyObject),
//   Global(name: 'PyExc_ArithmeticError', type: pPyObject),
//   Global(name: 'PyExc_AssertionError', type: pPyObject),
//   Global(name: 'PyExc_AttributeError', type: pPyObject),
//   Global(name: 'PyExc_BlockingIOError', type: pPyObject),
//   Global(name: 'PyExc_BrokenPipeError', type: pPyObject),
//   Global(name: 'PyExc_FloatingPointError', type: pPyObject),
//   Global(name: 'PyExc_OverflowError', type: pPyObject),
//   Global(name: 'PyExc_ZeroDivisionError', type: pPyObject),
//   Global(name: 'PyExc_OSError', type: pPyObject),
//   Global(name: 'PyExc_IOError', type: pPyObject),
//   Global(name: 'PyExc_ValueError', type: pPyObject),
//   Global(name: 'PyExc_EOFError', type: pPyObject),
//   Global(name: 'PyExc_MemoryError', type: pPyObject),
//   Global(name: 'PyExc_IndexError', type: pPyObject),
//   Global(name: 'PyExc_KeyError', type: pPyObject),
//   Global(name: 'PyExc_TypeError', type: pPyObject),

//   // Object Protocol
// // https://docs.python.org/3/c-api/object.html

//   Global(
//     name: 'Py_NotImplemented',
//     type: pPyObject,
//     documentation: '''
// The NotImplemented singleton, used to signal that an operation is not implemented for the given type combination.
// Increment the reference count before returning it.''',
//   ),

//   Global(
//     name: 'PyType_Type',
//     type: pPyObject,
//     documentation:
//         'The C structure of the objects used to describe built-in types.',
//   ),

//   /// https://docs.python.org/3/c-api/none.html
//   Global(
//     name: '_Py_NoneStruct',
//     type: pPyObject,
//     documentation: '''
// The Python None object, denoting lack of value. This object has no methods. It needs to be treated just like any other object with respect to reference counts.''',
//   ),

//   // https://docs.python.org/3/c-api/bool.html
//   Global(
//     name: '_Py_FalseStruct',
//     type: pPyObject,
//     documentation: '''
// The Python False object. This object has no methods. It needs to be treated just like any other object with respect to reference counts.''',
//   ),
//   Global(
//     name: '_Py_TrueStruct',
//     type: pPyObject,
//     documentation: '''
// The Python True object. This object has no methods. It needs to be treated just like any other object with respect to reference counts.''',
//   ),
//   // Global(name: 'PyFloat_Type', type: pyTypeObject),
//   // Global(name: 'PyComplex_Type', type: pyTypeObject),
//   // Global(name: 'PyCapsule_Type', type: pyTypeObject),
//   // Global(name: 'PyTuple_Type', type: pyTypeObject),
//   // Global(name: 'PyList_Type', type: pyTypeObject),
//   // Global(name: 'PyBytes_Type', type: pyTypeObject),
//   // Global(name: 'PyUnicode_Type', type: pyTypeObject),
//   // Global(name: 'PyDict_Type', type: pyTypeObject),
// ];
