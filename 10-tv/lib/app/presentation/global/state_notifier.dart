import 'package:flutter/foundation.dart';

abstract class StateNotifier<State> extends ChangeNotifier {
  StateNotifier(this._state) : _oldState = _state;

  State _state, _oldState;
  var _mounted = true;

  State get state => _state;
  State get oldState => _oldState;
  bool get mounted => _mounted;

  set state(State newState) => _update(newState);

  void onlyUpdate(State newState) => _update(newState, noti: false);

  void _update(State newState, {bool noti = true}) {
    if (_state != newState) {
      _oldState = state;
      _state = newState;
      if (noti) notifyListeners();
    }
  }

  @override
  void dispose() {
    _mounted = false;
    super.dispose();
  }
}
