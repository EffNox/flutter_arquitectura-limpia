import 'package:flutter/material.dart';
import 'package:navigation/pages/color_picker.dart';
import 'package:navigation/pages/counter_page.dart';
import 'package:navigation/pages/dialogs_page.dart';
import 'package:navigation/pages/login_page.dart';
import 'package:navigation/pages/menu_page.dart';
import 'package:navigation/pages/splash_page.dart';
import 'package:navigation/routes.dart';

T getArgs<T>(BuildContext ctx) => ModalRoute.of(ctx)!.settings.arguments as T;

Map<String, Widget Function(BuildContext)> get appRoutes => {
      Routes.splash: (_) => const SplashPage(),
      Routes.home: (_) => const MenuPage(),
      Routes.counter: (_) => const CounterPage(),
      Routes.login: (ctx) {
        final email = getArgs<String>(ctx);
        return LoginPage(email: email);
      },
      Routes.profile: (_) => const CounterPage(),
      Routes.colorPicker: (_) => const ColorPickerPage(),
      Routes.dialogs: (_) => const DialogsPage(),
    };
