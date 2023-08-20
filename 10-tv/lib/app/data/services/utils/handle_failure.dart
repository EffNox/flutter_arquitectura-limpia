import '../../../domain/either.dart';
import '../../../domain/failures/http_request/http_request_failure.dart';
import '../../http/http.dart';

Either<HttpRequestFailure, R> handleFailure<R>(HttpFailure httpFailure) {
  final failure = () {
    if (httpFailure.exception is NetworkException) return HttpRequestFailureNetwork();
    return switch (httpFailure.statusCode) {
      404 => HttpRequestFailureNotFound(),
      401 => HttpRequestFailureUnauthorized(),
      _ => HttpRequestFailureUnknown(),
    };
  }();
  return Either.left(failure);
}
