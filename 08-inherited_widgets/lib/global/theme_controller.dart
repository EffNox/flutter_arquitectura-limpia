import 'package:inherited_widgets/state_management/notifier.dart';

class ThemeController extends ProviderNotifier {
  final bool _isDarkModeEnabled = false;

  bool get isDarkModeEnabled => _isDarkModeEnabled;

  toggleTheme() {
    _isDarkModeEnabled != _isDarkModeEnabled;
    notify();
  }
}
