import 'package:ffi_tool/c.dart';

import 'structs.dart';
import 'type_aliases.dart';

const functions = [
  // The Very High Level Layer
  // https://docs.python.org/3/c-api/veryhigh.html
  // The functions in this chapter will let you execute Python source code given in a file or a buffer, but they will not let you interact in a more detailed way with the interpreter.
  // Several of these functions accept a start symbol from the grammar as a parameter. The available start symbols are Py_eval_input, Py_file_input, and Py_single_input. These are described following the functions which accept them as parameters.
  // Note also that several of these functions take FILE* parameters. One particular issue which needs to be handled carefully is that the FILE structure for different C libraries can be different and incompatible. Under Windows (at least), it is possible for dynamically linked extensions to actually use different libraries, so care should be taken that FILE* parameters are only passed to these functions if it is certain that they were created by the same library that the Python runtime is using.
  Func(
    name: 'Py_Main',
    parameterTypes: [cint, cwstring],
    returnType: cint,
    documentation: '''
The main program for the standard interpreter. This is made available for programs which embed Python. The argc and argv parameters should be prepared exactly as those which are passed to a C program’s main() function (converted to wchar_t according to the user’s locale). It is important to note that the argument list may be modified (but the contents of the strings pointed to by the argument list are not). The return value will be 0 if the interpreter exits normally (i.e., without an exception), 1 if the interpreter exits due to an exception, or 2 if the parameter list does not represent a valid Python command line.
Note that if an otherwise unhandled SystemExit is raised, this function will not return 1, but exit the process, as long as Py_InspectFlag is not set.''',
  ),

  Func(
    name: 'Py_BytesMain',
    parameterTypes: [cint, cstring],
    returnType: cint,
    documentation: '''
Similar to [Py_Main] but argv is an array of bytes strings.
New in version 3.8''',
  ),
  // TODO: More things here
  Func(
    name: 'PyRun_SimpleString',
    parameterTypes: [cstring],
    returnType: cint,
    documentation: '''
This is a simplified interface to [PyRun_SimpleStringFlags] below, leaving the PyCompilerFlags* argument set to NULL.''',
  ),
  Func(
    name: 'PyRun_SimpleStringFlags',
    parameterTypes: [cstring, pPyCompilerFlags],
    returnType: cint,
    documentation: '''
Executes the Python source code from command in the __main__ module according to the flags argument. If __main__ does not already exist, it is created. Returns 0 on success or -1 if an exception was raised. If there was an error, there is no way to get the exception information. For the meaning of flags, see below.
Note that if an otherwise unhandled SystemExit is raised, this function will not return -1, but exit the process, as long as Py_InspectFlag is not set.''',
  ),
  // Reference Counting
  // https://docs.python.org/3/c-api/refcounting.html
  Func(
    name: 'Py_IncRef',
    parameterTypes: [pPyObject],
    returnType: cvoid,
    documentation: '''
Increment the reference count for object o. The object may be NULL, in which case the function has no effect.''',
  ),
  Func(
    name: 'Py_DecRef',
    parameterTypes: [pPyObject],
    returnType: cvoid,
    documentation: '''
Decrement the reference count for object o. The object may be NULL, in which case the function has no effect.
If the reference count reaches zero, the object’s type’s deallocation function (which must not be NULL) is invoked.
Warning The deallocation function can cause arbitrary Python code to be invoked (e.g. when a class instance with a __del__() method is deallocated). While exceptions in such code are not propagated, the executed code has free access to all Python global variables. This means that any object that is reachable from a global variable should be in a consistent state before Py_DECREF() is invoked. For example, code to delete an object from a list should copy a reference to the deleted object in a temporary variable, update the list data structure, and then call Py_DECREF() for the temporary variable.''',
  ),

  // Exception Handling
  // https://docs.python.org/3/c-api/exceptions.html
  Func(
    name: 'PyErr_Clear',
    parameterTypes: [],
    returnType: cvoid,
    documentation: '''
Clear the error indicator. If the error indicator is not set, there is no effect.''',
  ),

  Func(
    name: 'PyErr_PrintEx',
    parameterTypes: [cint],
    returnType: cvoid,
    documentation: '''
Print a standard traceback to sys.stderr and clear the error indicator. Unless the error is a SystemExit, in that case no traceback is printed and the Python process will exit with the error code specified by the SystemExit instance.
Call this function only when the error indicator is set. Otherwise it will cause a fatal error!
If set_sys_last_vars is nonzero, the variables sys.last_type, sys.last_value and sys.last_traceback will be set to the type, value and traceback of the printed exception, respectively.''',
  ),
  Func(
      name: 'PyErr_Print',
      parameterTypes: [],
      returnType: cvoid,
      documentation: 'Alias for [PyErr_PrintEx(1)].'),

  //TODO: more
  Func(
    name: 'PyErr_SetString',
    parameterTypes: [pPyObject, cstring],
    returnType: cvoid,
    documentation: '''
This is the most common way to set the error indicator. The first argument specifies the exception type; it is normally one of the standard exceptions, e.g. PyExc_RuntimeError. You need not increment its reference count. The second argument is an error message; it is decoded from 'utf-8’.''',
  ),
  // TODO: More
  Func(
    name: 'PyErr_SetNone',
    parameterTypes: [pPyObject],
    returnType: cvoid,
    documentation: 'This is a shorthand for PyErr_SetObject(type, Py_None).',
  ),
  //TODO: More
  Func(
    name: 'PyErr_Occurred',
    parameterTypes: [],
    returnType: pPyObject,
    documentation: '''
Return value: Borrowed reference.
Test whether the error indicator is set. If set, return the exception type (the first argument to the last call to one of the PyErr_Set*() functions or to PyErr_Restore()). If not set, return NULL. You do not own a reference to the return value, so you do not need to Py_DECREF() it.
Note Do not compare the return value to a specific exception; use PyErr_ExceptionMatches() instead, shown below. (The comparison could easily fail since the exception may be an instance instead of a class, in the case of a class exception, or it may be a subclass of the expected exception.)''',
  ),
  //TODO: More
  Func(
    name: 'PyErr_NewException',
    parameterTypes: [cstring, pPyObject, pPyObject],
    returnType: pPyObject,
    documentation: '''
Return value: New reference.
This utility function creates and returns a new exception class. The name argument must be the name of the new exception, a C string of the form module.classname. The base and dict arguments are normally NULL. This creates a class object derived from Exception (accessible in C as PyExc_Exception).
The __module__ attribute of the new class is set to the first part (up to the last dot) of the name argument, and the class name is set to the last part (after the last dot). The base argument can be used to specify alternate base classes; it can either be only one class or a tuple of classes. The dict argument can be used to specify a dictionary of class variables and methods.''',
  ),
  // TODO: More
// Operating System Utilities
// https://docs.python.org/3/c-api/sys.html
// TODO: All of system

// Importing Modules
// https://docs.python.org/3/c-api/import.html
  Func(
    name: 'PyImport_ImportModule',
    parameterTypes: [cstring],
    returnType: pPyObject,
    documentation: '''
Return value: New reference.
This is a simplified interface to PyImport_ImportModuleEx() below, leaving the globals and locals arguments set to NULL and level set to 0. When the name argument contains a dot (when it specifies a submodule of a package), the fromlist argument is set to the list ['*'] so that the return value is the named module rather than the top-level package containing it as would otherwise be the case. (Unfortunately, this has an additional side effect when name in fact specifies a subpackage instead of a submodule: the submodules specified in the package’s __all__ variable are loaded.) Return a new reference to the imported module, or NULL with an exception set on failure. A failing import of a module doesn’t leave the module in sys.modules.
This function always uses absolute imports.''',
  ),
  // TODO More
  Func(
    name: 'PyImport_Import',
    parameterTypes: [pPyObject],
    returnType: pPyObject,
    documentation: '''
Return value: New reference.
This is a higher-level interface that calls the current “import hook function” (with an explicit level of 0, meaning absolute import). It invokes the __import__() function from the __builtins__ of the current globals. This means that the import is done using whatever import hooks are installed in the current environment.
This function always uses absolute imports.''',
  ),
// TODO More

// Data marshalling support
// https://docs.python.org/3/c-api/marshal.html
// TODO: All of data marshalling

// Parsing arguments and building values
// https://docs.python.org/3/c-api/arg.html
// TODO: This one is really good, but complex, since varargs
// TODO: A bunch

// String conversion and formatting
// https://docs.python.org/3/c-api/conversion.html
// TODO: This

// Reflection
// https://docs.python.org/3/c-api/reflection.html
  Func(
    name: 'PyEval_GetBuiltins',
    parameterTypes: [],
    returnType: pPyObject,
    documentation: '''
Return value: Borrowed reference.
Return a dictionary of the builtins in the current execution frame, or the interpreter of the thread state if no frame is currently executing.''',
  ),
  Func(
    name: 'PyEval_GetLocals',
    parameterTypes: [],
    returnType: pPyObject,
    documentation: '''
Return value: Borrowed reference.
Return a dictionary of the local variables in the current execution frame, or NULL if no frame is currently executing.''',
  ),
  Func(
    name: 'PyEval_GetGlobals',
    parameterTypes: [],
    returnType: pPyObject,
    documentation: '''
Return value: Borrowed reference.
Return a dictionary of the global variables in the current execution frame, or NULL if no frame is currently executing.''',
  ),
// TODO: More

// Code registry and support functions
// https://docs.python.org/3/c-api/codec.html
// TODO: This

// Object Protocol
// https://docs.python.org/3/c-api/object.html
  // TODO: Do some things
  Func(
    name: 'PyObject_GetAttrString',
    parameterTypes: [pPyObject, cstring],
    returnType: pPyObject,
    documentation: '''
Return value: New reference.
Retrieve an attribute named attr_name from object o. Returns the attribute value on success, or NULL on failure. This is the equivalent of the Python expression o.attr_name.''',
  ),
  Func(
    name: 'PyObject_SetAttrString',
    parameterTypes: [pPyObject, cstring, pPyObject],
    returnType: cint,
    documentation: '''
Set the value of the attribute named attr_name, for object o, to the value v. Raise an exception and return -1 on failure; return 0 on success. This is the equivalent of the Python statement o.attr_name = v.
If v is NULL, the attribute is deleted, however this feature is deprecated in favour of using PyObject_DelAttrString().''',
  ),
  // TODO: Some things
  Func(
    name: 'PyObject_RichCompareBool',
    parameterTypes: [pPyObject, pPyObject, cint],
    returnType: cint,
    documentation: '''
Compare the values of o1 and o2 using the operation specified by opid, which must be one of Py_LT, Py_LE, Py_EQ, Py_NE, Py_GT, or Py_GE, corresponding to <, <=, ==, !=, >, or >= respectively. Returns -1 on error, 0 if the result is false, 1 otherwise. This is the equivalent of the Python expression o1 op o2, where op is the operator corresponding to opid.
Note If o1 and o2 are the same object, PyObject_RichCompareBool() will always return 1 for Py_EQ and 0 for Py_NE.''',
  ),
  // TODO: Some things
  Func(
    name: 'PyObject_Str',
    parameterTypes: [pPyObject],
    returnType: pPyObject,
    documentation: '''
Return value: New reference.
Compute a string representation of object o. Returns the string representation on success, NULL on failure. This is the equivalent of the Python expression str(o). Called by the str() built-in function and, therefore, by the print() function.
Changed in version 3.4: This function now includes a debug assertion to help ensure that it does not silently discard an active exception.''',
  ),
  // TODO: Some things
  Func(
    name: 'PyCallable_Check',
    parameterTypes: [pPyObject],
    returnType: cint,
    documentation: '''
Determine if the object o is callable. Return 1 if the object is callable and 0 otherwise. This function always succeeds.''',
  ),
  Func(
    name: 'PyObject_Call',
    parameterTypes: [pPyObject, pPyObject, pPyObject],
    returnType: pPyObject,
    documentation: '''
Return value: New reference.
Call a callable Python object callable, with arguments given by the tuple args, and named arguments given by the dictionary kwargs.
args must not be NULL, use an empty tuple if no arguments are needed. If no named arguments are needed, kwargs can be NULL.
Return the result of the call on success, or raise an exception and return NULL on failure.
This is the equivalent of the Python expression: callable(*args, **kwargs).''',
  ),
  Func(
    name: 'PyObject_CallObject',
    parameterTypes: [pPyObject, pPyObject],
    returnType: pPyObject,
    documentation: '''
Return value: New reference.
Call a callable Python object callable, with arguments given by the tuple args. If no arguments are needed, then args can be NULL.
Return the result of the call on success, or raise an exception and return NULL on failure.
This is the equivalent of the Python expression: callable(*args).''',
  ),
  // TODO: Some things
  Func(
    name: 'PyObject_IsTrue',
    parameterTypes: [pPyObject],
    returnType: cint,
    documentation: '''
Returns 1 if the object o is considered to be true, and 0 otherwise. This is equivalent to the Python expression not not o. On failure, return -1.''',
  ),
  // TODO: Some things
  Func(
    name: 'PyObject_GetItem',
    parameterTypes: [pPyObject, pPyObject],
    returnType: pPyObject,
    documentation: '''
Return value: New reference.
Return element of o corresponding to the object key or NULL on failure. This is the equivalent of the Python expression o[key].''',
  ),
  Func(
    name: 'PyObject_SetItem',
    parameterTypes: [pPyObject, pPyObject, pPyObject],
    returnType: cint,
    documentation: '''
Map the object key to the value v. Raise an exception and return -1 on failure; return 0 on success. This is the equivalent of the Python statement o[key] = v. This function does not steal a reference to v.''',
  ),
  Func(
    name: 'PyObject_DelItem',
    parameterTypes: [pPyObject, pPyObject],
    returnType: cint,
    documentation: '''
Remove the mapping for the object key from the object o. Return -1 on failure. This is equivalent to the Python statement del o[key].''',
  ),
  Func(
    name: 'PyObject_Dir',
    parameterTypes: [pPyObject],
    returnType: pPyObject,
    documentation: '''
Return value: New reference.
This is equivalent to the Python expression dir(o), returning a (possibly empty) list of strings appropriate for the object argument, or NULL if there was an error. If the argument is NULL, this is like the Python dir(), returning the names of the current locals; in this case, if no execution frame is active then NULL is returned but PyErr_Occurred() will return false.''',
  ),
  Func(
    name: 'PyObject_GetIter',
    parameterTypes: [pPyObject],
    returnType: pPyObject,
    documentation: '''
Return value: New reference.
This is equivalent to the Python expression iter(o). It returns a new iterator for the object argument, or the object itself if the object is already an iterator. Raises TypeError and returns NULL if the object cannot be iterated.''',
  ),
// TODO: Some here

// Number protocol
// https://docs.python.org/3/c-api/number.html
// TODO: This

// Sequence protocol
// https://docs.python.org/3/c-api/sequence.html
// TODO: This

// Mapping protocol
// https://docs.python.org/3/c-api/mapping.html
// TODO: This

// Iterator protocol
// https://docs.python.org/3/c-api/iter.html
  Func(
    name: 'PyIter_Check',
    parameterTypes: [pPyObject],
    returnType: cint,
    documentation: '''
Return true if the object o supports the iterator protocol.''',
  ),
  Func(
    name: 'PyIter_Next',
    parameterTypes: [pPyObject],
    returnType: pPyObject,
    documentation: '''
Return value: New reference.
Return the next value from the iteration o. The object must be an iterator (it is up to the caller to check this). If there are no remaining values, returns NULL with no exception set. If an error occurs while retrieving the item, returns NULL and passes along the exception.''',
  ),

// Buffer protocol
// https://docs.python.org/3/c-api/buffer.html
// TODO: More
  Func(
    name: 'PyObject_GetBuffer',
    parameterTypes: [pPyObject, rawPyBuffer, cint],
    returnType: cint,
    documentation: '''
Send a request to exporter to fill in view as specified by flags. If the exporter cannot provide a buffer of the exact type, it MUST raise PyExc_BufferError, set view->obj to NULL and return -1.
On success, fill in view, set view->obj to a new reference to exporter and return 0. In the case of chained buffer providers that redirect requests to a single object, view->obj MAY refer to this object instead of exporter (See Buffer Object Structures).
Successful calls to PyObject_GetBuffer() must be paired with calls to PyBuffer_Release(), similar to malloc() and free(). Thus, after the consumer is done with the buffer, PyBuffer_Release() must be called exactly once.''',
  ),
  Func(
    name: 'PyBuffer_Release',
    parameterTypes: [rawPyBuffer],
    returnType: cvoid,
    documentation: '''
Release the buffer view and decrement the reference count for view->obj. This function MUST be called when the buffer is no longer being used, otherwise reference leaks may occur.
It is an error to call this function on a buffer that was not obtained via PyObject_GetBuffer().''',
  ),

  // TODO: More

// Type Objects
// https://docs.python.org/3/c-api/type.html
// TODO: More

  Func(
    name: 'PyType_IsSubtype',
    parameterTypes: [pPyTypeObject, pPyTypeObject],
    returnType: cint,
    documentation: '''
Return true if a is a subtype of b.
This function only checks for actual subtypes, which means that __subclasscheck__() is not called on b. Call PyObject_IsSubclass() to do the same check that issubclass() would do.''',
  ),
  // TODO: more
  Func(
    name: 'PyType_GenericNew',
    parameterTypes: [pPyTypeObject, pPyObject, pPyObject],
    returnType: pPyObject,
    documentation: '''
Return value: New reference.
Generic handler for the tp_new slot of a type object. Create a new instance using the type’s tp_alloc slot.''',
  ),
// TODO: More
  Func(
    name: 'PyType_Ready',
    parameterTypes: [pPyTypeObject],
    returnType: cint,
    documentation: '''
Finalize a type object. This should be called on all type objects to finish their initialization. This function is responsible for adding inherited slots from a type’s base class. Return 0 on success, or return -1 and sets an exception on error.''',
  ),
  // TODO: More

// Integer Objects
// https://docs.python.org/3/c-api/long.html
// TODO: Some stuff
  Func(
    name: 'PyLong_FromLong',
    parameterTypes: [clong],
    returnType: pPyObject,
    documentation: '''
Return value: New reference.
Return a new PyLongObject object from v, or NULL on failure.
The current implementation keeps an array of integer objects for all integers between -5 and 256, when you create an int in that range you actually just get back a reference to the existing object. So it should be possible to change the value of 1. I suspect the behaviour of Python in this case is undefined. :-)''',
  ),
  Func(
    name: 'PyLong_FromUnsignedLong',
    parameterTypes: [culong],
    returnType: pPyObject,
    documentation: '''
Return value: New reference.
Return a new PyLongObject object from a C unsigned long, or NULL on failure.''',
  ),
  // TODO More
  Func(
    name: 'PyLong_AsLong',
    parameterTypes: [pPyObject],
    returnType: clong,
    documentation: '''
Return a C long representation of obj. If obj is not an instance of PyLongObject, first call its __index__() or __int__() method (if present) to convert it to a PyLongObject.
Raise OverflowError if the value of obj is out of range for a long.
Returns -1 on error. Use PyErr_Occurred() to disambiguate.
Changed in version 3.8: Use __index__() if available.
Deprecated since version 3.8: Using __int__() is deprecated.''',
  ),
  // TODO More
  Func(
    name: 'PyLong_AsLongLong',
    parameterTypes: [pPyObject],
    returnType: clonglong,
    documentation: '''
Return a C long long representation of obj. If obj is not an instance of PyLongObject, first call its __index__() or __int__() method (if present) to convert it to a PyLongObject.
Raise OverflowError if the value of obj is out of range for a long long.
Returns -1 on error. Use PyErr_Occurred() to disambiguate.
Changed in version 3.8: Use __index__() if available.
Deprecated since version 3.8: Using __int__() is deprecated.''',
  ),

  // TODO More

  // Boolean Objects
  // https://docs.python.org/3/c-api/bool.html
  Func(
    name: 'PyBool_Check',
    parameterTypes: [pPyObject],
    returnType: cint,
    documentation: '''
Return true if o is of type PyBool_Type.''',
  ),
  Func(
    name: 'PyBool_FromLong',
    parameterTypes: [clong],
    returnType: pPyObject,
    documentation: '''
Return value: New reference.
Return a new reference to Py_True or Py_False depending on the truth value of v.''',
  ),
  // Floating Point Objects
  // https://docs.python.org/3/c-api/float.html
  // TODO: More
  Func(
    name: 'PyFloat_FromDouble',
    parameterTypes: [cdouble],
    returnType: pPyObject,
    documentation: '''
Return value: New reference.
Create a PyFloatObject object from v, or NULL on failure.''',
  ),
  // TODO: More
  Func(
    name: 'PyFloat_AsDouble',
    parameterTypes: [pPyObject],
    returnType: cdouble,
    documentation: '''
Return a C double representation of the contents of pyfloat. If pyfloat is not a Python floating point object but has a __float__() method, this method will first be called to convert pyfloat into a float. If __float__() is not defined then it falls back to __index__(). This method returns -1.0 upon failure, so one should call PyErr_Occurred() to check for errors.
Changed in version 3.8: Use __index__() if available.''',
  ),
  // TODO: More
  // Complex Number Objects
  // https://docs.python.org/3/c-api/complex.html

  // TODO: More
  Func(
    name: 'PyComplex_RealAsDouble',
    parameterTypes: [pPyObject],
    returnType: cdouble,
    documentation: '''Return the real part of op as a C double.''',
  ),
  Func(
    name: 'PyComplex_ImagAsDouble',
    parameterTypes: [pPyObject],
    returnType: cdouble,
    documentation: '''Return the complex part of op as a C double.''',
  ),
  // TODO: More

  // Bytes Objects
  // https://docs.python.org/3/c-api/bytes.html
  // TODO: This
  Func(
    name: 'PyBytes_AsStringAndSize',
    parameterTypes: [pPyObject, ppC, ppySize],
    returnType: cint,
    documentation: '''
Return the null-terminated contents of the object obj through the output variables buffer and length.
If length is NULL, the bytes object may not contain embedded null bytes; if it does, the function returns -1 and a ValueError is raised.
The buffer refers to an internal buffer of obj, which includes an additional null byte at the end (not counted in length). The data must not be modified in any way, unless the object was just created using PyBytes_FromStringAndSize(NULL, size). It must not be deallocated. If obj is not a bytes object at all, PyBytes_AsStringAndSize() returns -1 and raises TypeError.
Changed in version 3.5: Previously, TypeError was raised when embedded null bytes were encountered in the bytes object.''',
  ),
  //TODO: More
  // Byte Array Objects
  // https://docs.python.org/3/c-api/bytearray.html
  // TODO: this

  // Unicode Objects and Codecs
  // https://docs.python.org/3/c-api/unicode.html
  // TODO: This
  Func(
    name: 'PyUnicode_FromString',
    parameterTypes: [cstring],
    returnType: pPyObject,
    documentation: '''
Return value: New reference.
Create a Unicode object from a UTF-8 encoded null-terminated char buffer u.''',
  ),
  // TODO: More
  Func(
    name: 'PyUnicode_DecodeFSDefault',
    parameterTypes: [cstring],
    returnType: pPyObject,
    documentation: '''
Return value: New reference.
Decode a null-terminated string using Py_FileSystemDefaultEncoding and the Py_FileSystemDefaultEncodeErrors error handler.
If Py_FileSystemDefaultEncoding is not set, fall back to the locale encoding.
Use PyUnicode_DecodeFSDefaultAndSize() if you know the string length.
Changed in version 3.6: Use Py_FileSystemDefaultEncodeErrors error handler.''',
  ),
  // TODO: More
  Func(
    name: 'PyUnicode_AsUTF8String',
    parameterTypes: [pPyObject],
    returnType: pPyObject,
    documentation: '''
Return value: New reference.
Encode a Unicode object using UTF-8 and return the result as Python bytes object. Error handling is “strict”. Return NULL if an exception was raised by the codec.''',
  ),
  // TODO: More

  Func(
    name: 'PyUnicode_CompareWithASCIIString',
    parameterTypes: [pPyObject, cstring],
    returnType: cint,
    documentation: '''
Compare a Unicode object, uni, with string and return -1, 0, 1 for less than, equal, and greater than, respectively. It is best to pass only ASCII-encoded strings, but the function interprets the input string as ISO-8859-1 if it contains non-ASCII characters.
This function does not raise exceptions.''',
  ),

// Tuple Objects
// https://docs.python.org/3/c-api/tuple.html
//TODO: More
  Func(
    name: 'PyTuple_New',
    parameterTypes: [pySsizeT],
    returnType: pPyObject,
    documentation: '''
Return value: New reference.
Return a new tuple object of size len, or NULL on failure.''',
  ),
  //TODO: More
  Func(
    name: 'PyTuple_Size',
    parameterTypes: [pPyObject],
    returnType: pySsizeT,
    documentation: '''
Take a pointer to a tuple object, and return the size of that tuple.''',
  ),
  //TODO: More
  Func(
    name: 'PyTuple_GetItem',
    parameterTypes: [pPyObject, pySsizeT],
    returnType: pPyObject,
    documentation: '''
Return value: Borrowed reference.
Return the object at position pos in the tuple pointed to by p. If pos is out of bounds, return NULL and set an IndexError exception.''',
  ),
  //TODO: More
  Func(
    name: 'PyTuple_SetItem',
    parameterTypes: [pPyObject, pySsizeT, pPyObject],
    returnType: cint,
    documentation: '''
Insert a reference to object o at position pos of the tuple pointed to by p. Return 0 on success. If pos is out of bounds, return -1 and set an IndexError exception.
Note This function “steals” a reference to o and discards a reference to an item already in the tuple at the affected position.''',
  ),
  //TODO: More

// List Objects
// https://docs.python.org/3/c-api/list.html
//TODO: More
  Func(
    name: 'PyList_New',
    parameterTypes: [pySsizeT],
    returnType: pPyObject,
    documentation: '''
Return value: New reference.
Return a new list of length len on success, or NULL on failure.
Note If len is greater than zero, the returned list object’s items are set to NULL. Thus you cannot use abstract API functions such as PySequence_SetItem() or expose the object to Python code before setting all items to a real object with PyList_SetItem().''',
  ),
  Func(
    name: 'PyList_Size',
    parameterTypes: [pPyObject],
    returnType: pySsizeT,
    documentation: '''
Return the length of the list object in list; this is equivalent to len(list) on a list object.''',
  ),
  Func(
    name: 'PyList_GetItem',
    parameterTypes: [pPyObject, pySsizeT],
    returnType: pPyObject,
    documentation: '''
Return value: Borrowed reference.
Return the object at position index in the list pointed to by list. The position must be non-negative; indexing from the end of the list is not supported. If index is out of bounds (<0 or >=len(list)), return NULL and set an IndexError exception.''',
  ),
  Func(
    name: 'PyList_SetItem',
    parameterTypes: [pPyObject, pySsizeT, pPyObject],
    returnType: cint,
    documentation: '''
Set the item at index index in list to item. Return 0 on success. If index is out of bounds, return -1 and set an IndexError exception.
Note This function “steals” a reference to item and discards a reference to an item already in the list at the affected position.''',
  ),
  //TODO: More

  // Dict Objects
  // https://docs.python.org/3/c-api/dict.html

  //TODO: More
  Func(
    name: 'PyDict_New',
    parameterTypes: [],
    returnType: pPyObject,
    documentation: '''
Return value: New reference.
Return a new empty dictionary, or NULL on failure.''',
  ),

  //TODO: More
  Func(
    name: 'PyDict_Contains',
    parameterTypes: [pPyObject, pPyObject],
    returnType: cint,
    documentation: '''
Determine if dictionary p contains key. If an item in p is matches key, return 1, otherwise return 0. On error, return -1. This is equivalent to the Python expression key in p.''',
  ),

  //TODO: More

  Func(
    name: 'PyDict_SetItem',
    parameterTypes: [pPyObject, pPyObject, pPyObject],
    returnType: cint,
    documentation: '''
Insert val into the dictionary p with a key of key. key must be hashable; if it isn’t, TypeError will be raised. Return 0 on success or -1 on failure. This function does not steal a reference to val.''',
  ),
  Func(
    name: 'PyDict_SetItemString',
    parameterTypes: [pPyObject, cstring, pPyObject],
    returnType: cint,
    documentation: '''
Insert val into the dictionary p using key as a key. key should be a const char*. The key object is created using PyUnicode_FromString(key). Return 0 on success or -1 on failure. This function does not steal a reference to val.''',
  ),
  //TODO: More

  Func(
    name: 'PyDict_GetItem',
    parameterTypes: [pPyObject, pPyObject],
    returnType: pPyObject,
    documentation: '''
Return value: Borrowed reference.
Return the object from dictionary p which has a key key. Return NULL if the key key is not present, but without setting an exception.
Note that exceptions which occur while calling __hash__() and __eq__() methods will get suppressed. To get error reporting use PyDict_GetItemWithError() instead.''',
  ),
  //TODO: More

  Func(
    name: 'PyDict_GetItemString',
    parameterTypes: [pPyObject, cstring],
    returnType: pPyObject,
    documentation: '''
Return value: Borrowed reference.
This is the same as PyDict_GetItem(), but key is specified as a const char*, rather than a PyObject*.
Note that exceptions which occur while calling __hash__() and __eq__() methods and creating a temporary string object will get suppressed. To get error reporting use PyDict_GetItemWithError() instead.''',
  ),
  //TODO: More

  Func(
    name: 'PyDict_Keys',
    parameterTypes: [pPyObject],
    returnType: pPyObject,
    documentation: '''
Return value: New reference.
Return a PyListObject containing all the keys from the dictionary.''',
  ),
  Func(
    name: 'PyDict_Values',
    parameterTypes: [pPyObject],
    returnType: pPyObject,
    documentation: '''
Return value: New reference.
Return a PyListObject containing all the values from the dictionary p.''',
  ),
  Func(
    name: 'PyDict_Size',
    parameterTypes: [pPyObject],
    returnType: pySsizeT,
    documentation: '''
Return the number of items in the dictionary. This is equivalent to len(p) on a dictionary.''',
  ),
  //TODO: More

  // Set Objects
  // https://docs.python.org/3/c-api/set.html
  // TODO: This

  // Function objects
  // https://docs.python.org/3/c-api/function.html
  // TODO: This

  // Instance Method Objects
  // https://docs.python.org/3/c-api/method.html
  // TODO: This

  // Cell objects
  // https://docs.python.org/3/c-api/cell.html
  // TODO: this

  // Code Objects
  // https://docs.python.org/3/c-api/code.html
  // TODO: This

  // File Objects
  // https://docs.python.org/3/c-api/file.html
  // TODO: this

  // Module Objects
  // https://docs.python.org/3/c-api/module.html
  // TODO: This
  Func(
    name: 'PyModule_AddObject',
    parameterTypes: [pPyObject, cstring, pPyObject],
    returnType: cint,
    documentation: '''
Add an object to module as name. This is a convenience function which can be used from the module’s initialization function. This steals a reference to value on success. Return -1 on error, 0 on success.
Note Unlike other functions that steal references, PyModule_AddObject() only decrements the reference count of value on success.
This means that its return value must be checked, and calling code must Py_DECREF() value manually on error. Example usage:''',
  ),
  // TODO: More

  // Iterator Objects
  // https://docs.python.org/3/c-api/iterator.html
  // TODO: This

  // Descriptor objects
  // https://docs.python.org/3/c-api/descriptor.html
  // TODO: This

  // Slice Objects
  // https://docs.python.org/3/c-api/slice.html
  // TODO: This

  // Memory View Objects
  // https://docs.python.org/3/c-api/memoryview.html
  // TODO: This

  // Weak Reference Objects
  // https://docs.python.org/3/c-api/weakref.html
  // TODO: This

  // Capsule Objects
  // https://docs.python.org/3/c-api/capsule.html
  // TODO: This

  Func(
    name: 'PyCapsule_New',
    parameterTypes: ['*void', cstring, '*void'], // TODO: Fix parameter types
    returnType: pPyObject,
    documentation: '''
Return value: New reference.
Create a PyCapsule encapsulating the pointer. The pointer argument may not be NULL.
On failure, set an exception and return NULL.
The name string may either be NULL or a pointer to a valid C string. If non-NULL, this string must outlive the capsule. (Though it is permitted to free it inside the destructor.)
If the destructor argument is not NULL, it will be called with the capsule as its argument when it is destroyed.
If this capsule will be stored as an attribute of a module, the name should be specified as modulename.attributename. This will enable other modules to import the capsule using PyCapsule_Import().''',
  ),
  Func(
    name: 'PyCapsule_GetPointer',
    parameterTypes: [pPyObject, cstring],
    returnType: '*void',
    documentation: '''
Retrieve the pointer stored in the capsule. On failure, set an exception and return NULL.

The name parameter must compare exactly to the name stored in the capsule. If the name stored in the capsule is NULL, the name passed in must also be NULL. Python uses the C function strcmp() to compare capsule names.''',
  ),
// TODO: More

  // Generator objects
  // https://docs.python.org/3/c-api/gen.html
  // TODO: This

  // Coroutine objects
  // https://docs.python.org/3/c-api/coro.html
  // TODO: This

  // Context Variables Objects
  // https://docs.python.org/3/c-api/contextvars.html
  // TODO: This

  // Date Time Objects
  // https://docs.python.org/3/c-api/datetime.html
  // TODO: This

  // Initialization, Finalizaiton, Threads
  // https://docs.python.org/3/c-api/init.html
  // TODO: This
  Func(
    name: 'Py_Initialize',
    parameterTypes: [],
    returnType: cvoid,
    documentation: '''
Initialize the Python interpreter. In an application embedding Python, this should be called before using any other Python/C API functions; see Before Python Initialization for the few exceptions.
This initializes the table of loaded modules (sys.modules), and creates the fundamental modules builtins, __main__ and sys. It also initializes the module search path (sys.path). It does not set sys.argv; use PySys_SetArgvEx() for that. This is a no-op when called for a second time (without calling Py_FinalizeEx() first). There is no return value; it is a fatal error if the initialization fails.
Note On Windows, changes the console mode from O_TEXT to O_BINARY, which will also affect non-Python uses of the console using the C Runtime.''',
  ),
  Func(
    name: 'Py_InitializeEx',
    parameterTypes: [cint],
    returnType: cvoid,
    documentation: '''
This function works like Py_Initialize() if initsigs is 1. If initsigs is 0, it skips initialization registration of signal handlers, which might be useful when Python is embedded.''',
  ),
  Func(
    name: 'Py_IsInitialized',
    parameterTypes: [],
    returnType: cint,
    documentation: '''
Return true (nonzero) when the Python interpreter has been initialized, false (zero) if not. After Py_FinalizeEx() is called, this returns false until Py_Initialize() is called again.''',
  ),
  Func(
    name: 'Py_FinalizeEx',
    returnType: cint,
    parameterTypes: [],
    documentation: '''
Undo all initializations made by Py_Initialize() and subsequent use of Python/C API functions, and destroy all sub-interpreters (see Py_NewInterpreter() below) that were created and not yet destroyed since the last call to Py_Initialize(). Ideally, this frees all memory allocated by the Python interpreter. This is a no-op when called for a second time (without calling Py_Initialize() again first). Normally the return value is 0. If there were errors during finalization (flushing buffered data), -1 is returned.
This function is provided for a number of reasons. An embedding application might want to restart Python without having to restart the application itself. An application that has loaded the Python interpreter from a dynamically loadable library (or DLL) might want to free all memory allocated by Python before unloading the DLL. During a hunt for memory leaks in an application a developer might want to free all memory allocated by Python before exiting from the application.
Bugs and caveats: The destruction of modules and objects in modules is done in random order; this may cause destructors (__del__() methods) to fail when they depend on other objects (even functions) or modules. Dynamically loaded extension modules loaded by Python are not unloaded. Small amounts of memory allocated by the Python interpreter may not be freed (if you find a leak, please report it). Memory tied up in circular references between objects is not freed. Some memory allocated by extension modules may not be freed. Some extensions may not work properly if their initialization routine is called more than once; this can happen if an application calls Py_Initialize() and Py_FinalizeEx() more than once.
Raises an auditing event cpython._PySys_ClearAuditHooks with no arguments.
New in version 3.6.''',
  ),
  Func(
    name: 'Py_Finalize',
    returnType: cvoid,
    parameterTypes: [],
    documentation: '''
This is a backwards-compatible version of Py_FinalizeEx() that disregards the return value.''',
  ),

  // TODO: More

  // Python Initialization Configuration
  // https://docs.python.org/3/api/init_config.html
  // TODO: This

  // Memory Management
  // https://docs.python.org/3/c-api/memory.html
  // TODO: This

  //Object Implementation Supports
  // https://docs.python.org/3/c-api/objimpl.html
  // TODO: Several Sections Here
];
