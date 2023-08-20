import 'package:flutter/material.dart';
import 'package:forms/pages/login/login_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus
          ?.unfocus(), // Minimizar el teclado en cualquier input
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const LoginPage(),
        theme: ThemeData.light(),
      ),
    );
  }
}
