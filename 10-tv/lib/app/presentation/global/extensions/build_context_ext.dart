import 'package:flutter/material.dart';

import '../../../domain/enums.dart';

extension BuildContextExt on BuildContext {
  bool get darkMode => Theme.of(this).brightness == Brightness.dark;

  TextTheme get textTheme => Theme.of(this).textTheme;

  void snackBar({required String msg, SnackBarTypes type = SnackBarTypes.success}) {
    final bgColor = switch (type) {
      SnackBarTypes.success => Colors.greenAccent.withOpacity(.7),
      SnackBarTypes.error => Colors.red.withOpacity(.7),
      SnackBarTypes.warning => const Color(0xfff9a11f),
    };

    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        backgroundColor: bgColor,
        content: Text(
          msg,
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}
