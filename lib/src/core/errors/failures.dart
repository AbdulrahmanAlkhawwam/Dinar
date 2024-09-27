abstract class Failure {
  final String message;

  Failure(this.message);

  @override
  String toString() {
    return "$runtimeType($message)";
  }
}

class DatabaseFailure extends Failure {
  DatabaseFailure(super.message);
}

class CacheFailure extends Failure {
  CacheFailure(super.message);
}

class UnknownFailure extends Failure {
  UnknownFailure(super.message);
}

class ParsingFailure extends Failure {
  ParsingFailure(super.message);
}
