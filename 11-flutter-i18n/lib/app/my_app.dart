import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:i18n/app/pages/home/home_view.dart';
import 'package:i18n/translations.g.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // final lang = WidgetsBinding.instance.platformDispatcher.locale;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const HomeView(),
      // home: const CalendarPage(),
      // localizationsDelegates: const [
      //   GlobalMaterialLocalizations.delegate, // ANDROID
      //   // GlobalCupertinoLocalizations.delegate, //IOS
      //   // GlobalWidgetsLocalizations.delegate
      // ],
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: AppLocaleUtils.supportedLocales,
      locale: TranslationProvider.of(context).flutterLocale, // SI NO SE PONE 'locale', EL PLUGIN TOMARÁ POR DEFECTO EL QUE TENGA EL SISTEMA
    );
  }
}
