import 'package:flutter/widgets.dart' show StatelessWidget, GlobalKey;

mixin MountedMixin on StatelessWidget {
  final widgetKey = GlobalKey();

  bool get mounted => widgetKey.currentContext != null;
}
