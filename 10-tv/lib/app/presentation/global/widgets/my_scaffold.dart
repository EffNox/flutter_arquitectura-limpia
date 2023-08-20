import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/repositories/connectivity_repository.dart';

class ScaffoldPage extends StatelessWidget {
  const ScaffoldPage({Key? key, required this.body, this.appBar}) : super(key: key);

  final Widget body;
  final PreferredSizeWidget? appBar;

  @override
  Widget build(BuildContext context) {
    final ConnectivityRepository connectivityRepo = context.read();

    return Scaffold(
      appBar: appBar,
      body: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Expanded(child: body),
              StreamBuilder<bool>(
                initialData: connectivityRepo.hasInternet,
                stream: connectivityRepo.onInternetChanged,
                builder: (_, snap) {
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    transitionBuilder: (child, animation) => ScaleTransition(scale: animation, child: child),
                    child: snap.data == false
                        ? Container(
                            width: double.infinity,
                            color: Colors.red.withOpacity(.4),
                            child: const Text(
                              'No hay internet',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          )
                        : const SizedBox.shrink(),
                  );
                },
              )
            ],
          )),
    );
  }
}
