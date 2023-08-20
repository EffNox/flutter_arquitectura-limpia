import './sign_in_state.dart';
import '../../../../domain/either.dart';
import '../../../../domain/failures/sign_in_failure.dart';
import '../../../../domain/models/user.dart';
import '../../../../domain/repositories/authentication_repository.dart';
import '../../../global/controllers/favorites/favorites_controller.dart';
import '../../../global/controllers/session_controller.dart';
import '../../../global/state_notifier.dart';

class SignInController extends StateNotifier<SignInState> {
  SignInController(
    super.state, {
    required this.authenticationRepository,
    required this.sessionController,
    required this.favoritesController,
  });
  final AuthenticationRepository authenticationRepository;
  final SessionController sessionController;
  final FavoritesController favoritesController;

  void onUsrChanged(String v) => onlyUpdate(state.copyWith(usr: v.replaceAll(' ', '')));
  void onPwdChanged(String v) => onlyUpdate(state.copyWith(pwd: v.replaceAll(' ', '')));

  Future<Either<SignInFailure, User>> submit() async {
    state = state.copyWith(fetching: true);
    final rs = await authenticationRepository.signIn(state.usr, state.pwd);
    rs.when(
        left: (_) => state = state.copyWith(fetching: false),
        right: (usr) {
          sessionController.setUser(usr);
          favoritesController.init();
        });
    return rs;
  }
}
