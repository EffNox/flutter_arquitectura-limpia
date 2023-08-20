import 'package:flutter/material.dart';
import 'package:navigation/app_routes.dart';
import 'package:navigation/routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      initialRoute: Routes.initialRoute,
      routes: appRoutes,
    );
  }
}
