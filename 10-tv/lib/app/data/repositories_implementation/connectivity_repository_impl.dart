import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

import '../../domain/repositories/connectivity_repository.dart';
import '../services/remote/internet_checker.dart';

class ConnectivityRepositoryImpl implements ConnectivityRepository {
  final Connectivity _connectivity;
  final InternetChecker _internetChecker;
  final _ctl = StreamController<bool>.broadcast();
  late bool _hasInternet;
  StreamSubscription? _subscription;

  ConnectivityRepositoryImpl(this._connectivity, this._internetChecker);

  @override
  bool get hasInternet => _hasInternet;

  @override
  Stream<bool> get onInternetChanged => _ctl.stream;

  @override
  Future<void> initialize() async {
    Future<bool> hasInternet(ConnectivityResult rs) async {
      if (rs == ConnectivityResult.none) return false;
      return await _internetChecker.hasInternet();
    }

    _hasInternet = await hasInternet(await _connectivity.checkConnectivity());

    _connectivity.onConnectivityChanged.listen((e) async {
      _subscription?.cancel();
      _subscription = hasInternet(e).asStream().listen((connected) {
        _hasInternet = connected;
        if (_ctl.hasListener && !_ctl.isClosed) _ctl.add(_hasInternet);
      });
    });
  }
}
