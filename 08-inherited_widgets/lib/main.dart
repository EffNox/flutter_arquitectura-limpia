import 'package:flutter/material.dart';
import 'package:inherited_widgets/global/theme_controller.dart';
import 'package:inherited_widgets/pages/home_page.dart';
import 'package:inherited_widgets/state_management/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<ThemeController>(
      child: const MaterialApp(
        home: HomePage(),
        // theme: _isDarkModeEnabled
        //     ? ThemeData.dark(useMaterial3: true)
        //     : ThemeData.light(useMaterial3: true),
      ),
      create: () => ThemeController(),
    );
  }
}

/* class ThemeProvider extends InheritedWidget {
  final bool isDarkModeEnabled;
  final void Function() toggleCallBack;

  const ThemeProvider(
      {Key? key,
      required this.toggleCallBack,
      required this.isDarkModeEnabled,
      required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(ThemeProvider oldWidget) {
    return oldWidget.isDarkModeEnabled != isDarkModeEnabled;
  }

  static ThemeProvider of(BuildContext context) {
    final provider =
        context.dependOnInheritedWidgetOfExactType<ThemeProvider>();
    assert(provider != null, 'No se encontro la instancia de ThemeProvider');
    return provider!;
  }
}
 */
