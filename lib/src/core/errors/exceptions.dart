class CacheException implements Exception {
  final String message;

  const CacheException(this.message);

  @override
  String toString() {
    return "$runtimeType($message)";
  }
}

// there are no api to get serverException

// class ServerException extends AppException {
//   final int? statusCode;
//   final body;
//
//   ServerException(super.message, {this.statusCode, this.body});
//
//   @override
//   String toString() => "$runtimeType[$statusCode]($message)";
// }

// there are no api to get ExpiredSubscriptionException

// class ExpiredSubscriptionException implements Exception {
//   final String message;
//
//   const ExpiredSubscriptionException(this.message);
//
//   @override
//   String toString() {
//     return "$runtimeType($message)";
//   }
// }

abstract class AppException implements Exception {
  final String message;

  const AppException(this.message);

  @override
  String toString() => "$runtimeType($message)";
}

// there are no users to get AuthorizationException

// class AuthorizationException extends AppException {
//   final bool retry;
//
//   AuthorizationException(super.message, this.retry);
// }

class ParsingException extends AppException {
  ParsingException(super.message);
}

// there are no api to get SubscriptionException

// class SubscriptionException extends AppException {
//   final String? code;
//
//   SubscriptionException(super.message, {this.code});
//
//   @override
//   String toString() => "$runtimeType[$code]($message)";
// }
