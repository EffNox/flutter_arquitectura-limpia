import 'package:shared_preferences/shared_preferences.dart';

class SessionController {
  late bool _isSignedIn;
  bool get isSignedIn => _isSignedIn;
  final SharedPreferences _preferences;

  SessionController(this._preferences) {
    _isSignedIn = _preferences.getBool('session') ?? false;
  }

  void setSignedIn(bool v) {
    _isSignedIn = v;
    _preferences.setBool('session', v);
  }
}
