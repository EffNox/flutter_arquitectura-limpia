import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../domain/repositories/connectivity_repository.dart';
import '../../../../generated/translations.g.dart';
import '../../../routes/router.dart';

class OfflinePage extends StatefulWidget {
  const OfflinePage({Key? key}) : super(key: key);

  @override
  State<OfflinePage> createState() => _OfflinePageState();
}

class _OfflinePageState extends State<OfflinePage> {
  StreamSubscription? _subscription;

  @override
  void initState() {
    super.initState();

    _subscription = context.read<ConnectivityRepository>().onInternetChanged.listen((connected) async {
      // if (connected) context.pushNamed(Routes.splash);
      final initialRoute = await getInitialRouteName(context);
      if (connected && mounted) context.goNamed(initialRoute);
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text(t.misc.textOffline, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold))));
  }
}
