import 'package:flutter/material.dart';

import 'app/data/repositories_impl/notifications_repository_impl.dart';
import 'app/domain/repositories/notifications_repository.dart';
import 'app/presentation/modules/home/views/home_view.dart';

void main() {
  runApp(Provider(notificationsRepository: NotificationsRepositoryImpl(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const HomeView(),
    );
  }
}

class Provider extends InheritedWidget {
  const Provider({
    super.key,
    required super.child,
    required this.notificationsRepository,
  });

  final NotificationsRepository notificationsRepository;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;

  static Provider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>()!;
  }
}
