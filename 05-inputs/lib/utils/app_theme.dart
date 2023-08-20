import 'package:flutter/material.dart';
import 'package:inputs/utils/material_color_generator.dart';

ThemeData getThemeData(BuildContext context) {
  return ThemeData(
    useMaterial3: true,
    primarySwatch: generateMaterialColor(
      const Color.fromARGB(255, 127, 0, 191),
    ), // Color primario de la aplicación (cambia el borde de los inputs TextField)
    colorScheme: const ColorScheme.light(
      primary: Colors.blue,
    ),
    hintColor: Colors.black,
    inputDecorationTheme: const InputDecorationTheme(
      // floatingLabelStyle: TextStyle(color: Colors.blue),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 2),
        // borderRadius: BorderRadius.circular(0),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 2, color: Colors.black12),
        // borderRadius: BorderRadius.circular(0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 2, color: Colors.amber),
        // borderRadius: BorderRadius.circular(0),
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(Colors.black),
      fillColor: MaterialStateProperty.all(Colors.yellowAccent),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      overlayColor: MaterialStateProperty.all(Colors.amber),
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all(Colors.black),
      // visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(Colors.amber),
      trackColor: MaterialStateProperty.all(Colors.black),
    ),
    sliderTheme: SliderThemeData(
      trackHeight: 15,
      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15),
      activeTrackColor: Colors.pink,
      thumbColor: Colors.black,
      overlayColor: Colors.green.withOpacity(.1),
      valueIndicatorColor: Colors.amberAccent,
      valueIndicatorTextStyle: const TextStyle(color: Colors.black),
      inactiveTrackColor: Colors.grey.withOpacity(.2),
      inactiveTickMarkColor: Colors.white,
    ),
  );
}
