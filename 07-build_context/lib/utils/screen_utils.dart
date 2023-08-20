import 'package:flutter/material.dart';

extension ScreenUtilsExtension on BuildContext {
  MediaQueryData get mediaQuery =>
      findAncestorWidgetOfExactType<MediaQuery>()!.data;

  String get statusBarHeight => mediaQuery.viewPadding.top.toString();

  Size get screenSize => mediaQuery.size;
}
