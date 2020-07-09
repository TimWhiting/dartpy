class DartPyException implements Exception {
  String message;
  DartPyException(this.message);
  @override
  String toString() {
    return 'DartPyException($message)';
  }
}
