import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_state.freezed.dart';

@freezed
class SignInState with _$SignInState {
  const factory SignInState({
    @Default('NixRoYal') String usr,
    @Default('password1999') String pwd,
    @Default(false) bool fetching,
  }) = _SignInState;
}


// Con equetable
// class SignInState extends Equatable {
//   final String usr, pwd;
//   final bool fetching;

//   const SignInState({
//     this.usr = 'NixRoYal',
//     this.pwd = 'password1999',
//     this.fetching = false,
//   });

//   SignInState copyWith({
//     String? usr,
//     String? pwd,
//     bool? fetching,
//   }) =>
//       SignInState(
//         usr: usr ?? this.usr,
//         pwd: pwd ?? this.pwd,
//         fetching: fetching ?? this.fetching,
//       );

//   @override
//   List<Object?> get props => [usr, pwd, fetching];
// }
