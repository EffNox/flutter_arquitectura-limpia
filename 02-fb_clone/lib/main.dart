import 'package:device_preview/device_preview.dart';
import 'package:fb_clone/facebook_ui/facebook_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DevicePreview(
    builder: (_) => const MainApp(),
    enabled: !kReleaseMode,
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      builder: DevicePreview.appBuilder,
      locale: DevicePreview.locale(context),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Grandstander',
      ),
      // theme: ThemeData.light(
      //   useMaterial3: true,
      // ).copyWith(
      //   textTheme: const TextTheme(
      //     displayLarge: TextStyle(
      //       fontWeight: FontWeight.bold,
      //       fontFamily: 'Roboto',
      //     ),
      //     bodyLarge: TextStyle(
      //       fontFamily: 'Roboto',
      //     ),
      //   ),
      // ),
      home: const FacebookPage(),
      // home: const AspectRatioPage(),
    );
  }
}
