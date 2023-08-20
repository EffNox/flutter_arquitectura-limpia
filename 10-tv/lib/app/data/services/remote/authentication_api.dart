import '../../../domain/either.dart';
import '../../../domain/failures/sign_in_failure.dart';
import '../../http/http.dart';

class AuthenticationApi {
  AuthenticationApi(this._http);
  final Http _http;

  Either<SignInFailure, String> _handleFailure(HttpFailure failure) {
    if (failure.statusCode != null) {
      switch (failure.statusCode) {
        case 401:
          if (failure.data is Map && (failure.data as Map)['status_code'] == 32) return Either.left(NotVerified());
          return Either.left(Unauthorized());
        case 404:
          return Either.left(NotFound());
        default:
          return Either.left(Unknown());
      }
    }
    if (failure.exception is NetworkException) return Either.left(Network());
    return Either.left(Unknown());
  }

  Future<Either<SignInFailure, String>> createRequestToken() async {
    final rs = await _http.request(
      '/authentication/token/new',
      onSuccess: (responseBody) {
        final json = responseBody as Map;
        return json['request_token'] as String;
      },
    );
    return rs.when(left: _handleFailure, right: (requestToken) => Either.right(requestToken));
  }

  Future<Either<SignInFailure, String>> createSessionWithLogin({
    required String usr,
    required String pwd,
    required String requestToken,
  }) async {
    final rs = await _http.request(
      '/authentication/token/validate_with_login',
      method: HttpMethod.post,
      body: {'username': usr, 'password': pwd, 'request_token': requestToken},
      onSuccess: (responseBody) {
        final json = responseBody as Map;
        return json['request_token'] as String;
      },
    );
    return rs.when(left: _handleFailure, right: (newRequestToken) => Either.right(newRequestToken));
  }

  Future<Either<SignInFailure, String>> createSession(String requestToken) async {
    final rs = await _http.request(
      '/authentication/session/new',
      method: HttpMethod.post,
      body: {'request_token': requestToken},
      onSuccess: (responseBody) {
        final json = responseBody as Map;
        return json['session_id'] as String;
      },
    );

    return rs.when(left: _handleFailure, right: (sessionId) => Either.right(sessionId));
  }
}
