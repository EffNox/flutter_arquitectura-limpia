import 'package:flutter/material.dart';
import 'package:keys/pages/global_key_movable_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // home: AnimatedTextPage(),
      // home: ListKeysPage(),
      // home: ListPage(),
      home: MovablePage(),
    );
  }
}
