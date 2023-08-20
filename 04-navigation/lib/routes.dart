class Routes {
  Routes._();
  static final Routes _instance = Routes._();
  factory Routes() => _instance;

  static const initialRoute = splash;

  static const home = '/home';
  static const splash = '/splash';
  static const menu = '/menu';
  static const counter = '/counter';
  static const login = '/login';
  static const profile = '/profile';
  static const colorPicker = '/color-picker';
  static const dialogs = '/dialogs';
}
