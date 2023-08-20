import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'generated/translations.g.dart';
import 'presentation/global/controllers/theme_controller.dart';
import 'presentation/global/theme.dart';
import 'presentation/modules/splash/pages/splash_page.dart';
import 'presentation/routes/router.dart';

class AppPage extends StatefulWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> with RouterMixin {
  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = context.watch();

    if (loading) return const SplashPage();

    return GestureDetector(
      onTap: FocusManager.instance.primaryFocus?.unfocus,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        theme: getTheme(themeController.darkMode),
        // MULTIPLE IDIOMA CONF
        localizationsDelegates: GlobalMaterialLocalizations.delegates,
        locale: TranslationProvider.of(context).flutterLocale,
        supportedLocales: AppLocaleUtils.supportedLocales,
      ),
    );
  }
}
