abstract class AppException implements Exception {
  final String message;

  const AppException(this.message);

  @override
  String toString() => "$runtimeType($message)";
}

class DeleteException extends AppException {
  DeleteException(super.message);

  @override
  String toString() {
    return message;
  }
}

class CacheException extends AppException {
  CacheException(super.message);
}

class ParsingException extends AppException {
  ParsingException(super.message);
}
