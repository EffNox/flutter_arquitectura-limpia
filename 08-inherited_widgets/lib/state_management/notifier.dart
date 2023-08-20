import 'package:flutter/foundation.dart';

typedef VoidCallback = void Function();

abstract class ProviderNotifier {
  final List<VoidCallback> _listener = [];

  addListener(VoidCallback listener) {
    _listener.add(listener);
  }

  removeListener(VoidCallback listener) {
    _listener.remove(listener);
  }

  @protected
  notify() {
    for (var listener in _listener) {
      listener();
    }
  }

  @protected
  @mustCallSuper
  dispose() {
    _listener.clear();
  }
}
