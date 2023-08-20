import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../generated/translations.g.dart';
import '../../../global/colors.dart';
import '../../../global/controllers/theme_controller.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});
  // final darkMode = View.of(context).platformDispatcher.platformBrightness == Brightness.dark;
  // final darkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.read<ThemeController>().darkMode;

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Material(
        color: isDarkMode ? AppColors.darkLight : null,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                width: 80,
                height: 80,
                child: CircularProgressIndicator(strokeWidth: 8),
              ),
              const SizedBox(height: 15),
              Text(t.misc.textLoading,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: isDarkMode ? Colors.white : null,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
