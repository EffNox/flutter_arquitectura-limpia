import 'package:build_context/pages/product_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(useMaterial3: true),
      // home: const HomePage(),
      home: ProductPage(),
      // home: const SplashPage(),
    );
  }
}
