import '../../domain/either.dart';
import '../../domain/failures/sign_in_failure.dart';
import '../../domain/models/user.dart';
import '../../domain/repositories/authentication_repository.dart';
import '../services/local/session_service.dart';
import '../services/remote/account_api.dart';
import '../services/remote/authentication_api.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationApi _authenticationApi;
  final SessionService _sessionService;
  final AccountAPI _accountAPI;

  AuthenticationRepositoryImpl(this._authenticationApi, this._sessionService, this._accountAPI);

  @override
  Future<bool> get isSignedIn async {
    final sessionId = await _sessionService.sessionId;
    return sessionId != null;
  }

  @override
  Future<Either<SignInFailure, User>> signIn(String usr, String pwd) async {
    final requestTokenResult = await _authenticationApi.createRequestToken();
    return requestTokenResult.when(
        left: (failure) => Either.left(failure),
        right: (requestToken) async {
          final loginResult = await _authenticationApi.createSessionWithLogin(
            usr: usr,
            pwd: pwd,
            requestToken: requestToken,
          );

          // await Future.delayed(const Duration(seconds: 2));
          return loginResult.when(
              left: (fail) => Either.left(fail),
              right: (newRequestToken) async {
                final sessionResult = await _authenticationApi.createSession(requestToken);
                return sessionResult.when(
                    left: (failure) async => Either.left(failure),
                    right: (sessionId) async {
                      await _sessionService.saveSessionId(sessionId);
                      final user = await _accountAPI.getAccount(sessionId);
                      if (user == null) return Either.left(Unknown());
                      return Either.right(user);
                    });
              });
        });
  }

  @override
  Future<void> signOut() => _sessionService.signOut();
}
