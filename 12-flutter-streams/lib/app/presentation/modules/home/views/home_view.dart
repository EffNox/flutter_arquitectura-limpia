import 'package:flutter/material.dart';

import '../../../../../main.dart';
import '../../../../domain/models/notification.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const Scaffold())),
            icon: const Icon(Icons.logout_outlined),
          ),
        ],
      ),
      body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StreamBuilder<AppNotification>(
                // initialData: AppNotification(title: 'EffNox', body: 'body', createdAt: DateTime.now()),
                stream: Provider.of(context).notificationsRepository.onNotification,
                builder: (_, snap) {
                  if (!snap.hasData) return const CircularProgressIndicator();

                  return ListTile(
                    title: Text(snap.data!.title),
                  );
                },
              )
            ],
          )),
    );
  }
}
