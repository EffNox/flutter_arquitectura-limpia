import 'package:flutter/material.dart';

// Convertir cualquier Color a MaterialColor
MaterialColor generateMaterialColor(Color color) {
  final Map<int, Color> swatch = {};
  for (var i = 0; i < 10; i++) {
    int key = (i == 0) ? 50 : (i * 100);
    final opacity = (0.1 * i) + 0.1;
    swatch[key] = Color.fromRGBO(color.red, color.green, color.blue, opacity);
  }
  return MaterialColor(color.value, swatch);
}
