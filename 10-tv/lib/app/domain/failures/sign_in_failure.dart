// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'sign_in_failure.freezed.dart';

// @freezed
// class SignInFailure with _$SignInFailure {
//   factory SignInFailure.notFound() = NotFound;
//   factory SignInFailure.network() = Network;
//   factory SignInFailure.unauthorized() = Unauthorized;
//   factory SignInFailure.unknown() = Unknown;
// }

sealed class SignInFailure {}

class NotFound extends SignInFailure {}

class NotVerified extends SignInFailure {}

class Network extends SignInFailure {}

class Unauthorized extends SignInFailure {}

class Unknown extends SignInFailure {}
