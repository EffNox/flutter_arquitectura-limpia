import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

ThemeData getTheme(bool darkMode) {
  if (darkMode) {
    final darkTheme = ThemeData.dark(useMaterial3: true);
    final textTheme = darkTheme.textTheme;
    const boldStyle = TextStyle(fontWeight: FontWeight.bold);
    const whiteStyle = TextStyle(color: Colors.white);

    return darkTheme.copyWith(
      textTheme: GoogleFonts.nunitoSansTextTheme(
        textTheme.copyWith(
          titleSmall: textTheme.titleSmall?.merge(boldStyle),
          titleMedium: textTheme.titleMedium?.merge(boldStyle),
          titleLarge: textTheme.titleLarge?.merge(boldStyle),
          bodySmall: textTheme.bodySmall?.merge(whiteStyle),
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.dark,
      ),
      scaffoldBackgroundColor: AppColors.darkLight,
      canvasColor: AppColors.darkLight, //COLOR DE FONDO LAS OPCIONES DEL SELECT (DropdownButton) FLOTANTE
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.all(Colors.blue),
        trackColor: MaterialStateProperty.all(Colors.lightBlue.withOpacity(.4)),
      ),
    );
  }

  final lightTheme = ThemeData.light(useMaterial3: true);
  final textTheme = lightTheme.textTheme;
  const boldStyle = TextStyle(color: AppColors.dark, fontWeight: FontWeight.bold);
  const darkStyle = TextStyle(color: AppColors.dark);

  return lightTheme.copyWith(
    textTheme: GoogleFonts.nunitoSansTextTheme(
      lightTheme.textTheme.copyWith(
        titleSmall: textTheme.titleSmall?.merge(boldStyle),
        titleMedium: textTheme.titleMedium?.merge(boldStyle),
        titleLarge: textTheme.titleLarge?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        bodySmall: textTheme.bodySmall?.merge(darkStyle),
      ),
    ),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: AppColors.dark),
    ),
  );
}
