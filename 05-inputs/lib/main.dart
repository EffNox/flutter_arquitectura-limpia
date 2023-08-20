import 'package:flutter/material.dart';
import 'package:inputs/app_routes.dart';
import 'package:inputs/utils/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final focus = FocusScope.of(context);
        final focusedChild = focus.focusedChild;
        if (focusedChild != null && !focusedChild.hasPrimaryFocus) {
          focusedChild.unfocus();
        }
      },
      child: MaterialApp(
        theme: getThemeData(context),
        home: const HomePage(),
        routes: appRoutes,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final keys = appRoutes.keys.toList();
    return Scaffold(
      body: ListView.builder(
        itemCount: keys.length,
        itemBuilder: (_, i) {
          final routeName = keys[i];
          return ListTile(
            onTap: () => Navigator.pushNamed(context, routeName),
            title: Text(routeName),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
          );
        },
      ),
    );
  }
}
