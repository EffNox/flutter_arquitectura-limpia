import 'package:flutter/material.dart';

import 'pages/splash_page.dart';
import 'router/router.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with RouterMixin {
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => init());
  }

  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 1));
    if (mounted) setState(() => _loading = false);
  }

  @override
  Widget build(BuildContext context) {
    // if (_loading) return const Material(child: Center(child: CircularProgressIndicator()));
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: _loading
          ? const SplashPage()
          : MaterialApp.router(
              routerConfig: router,
              debugShowCheckedModeBanner: false,
              theme: ThemeData.dark(useMaterial3: true),
            ),
    );
  }
}

/* 
class MyPage {
  final String path;
  final Widget Function(Map<String, String> v) builder;

  MyPage(this.builder, {required this.path});
}

class MyRouterDelegate extends RouterDelegate<Uri> with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final List<MyPage> pages;
  late List<Page> _navigatorPages;

  MyRouterDelegate({required this.pages}) {
    final initialPage = pages.firstWhere((element) => element.path == '/');
    _navigatorPages = [MaterialPage(name: '/', child: initialPage.builder({}))];
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: _navigatorPages,
      onPopPage: (route, result) {
        if (route.didPop(result)) {
          _navigatorPages.removeWhere((element) => element.name == route.settings.name);
          notifyListeners();
          return true;
        }
        return false;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(Uri configuration) async {
    final path = configuration.path;
    final data = <String, String>{};
    final index = pages.indexWhere((e) {
      if (e.path == path) return true;

      if (e.path.contains('/:')) {
        final lastIndex = e.path.lastIndexOf('/:');
        final sub = e.path.substring(0, lastIndex);
        if (path.startsWith(sub)) {
          final key = e.path.substring(lastIndex + 2, e.path.length);
          final val = path.substring(lastIndex + 1, path.length);
          data[key] = val;
          return true;
        }
      }
      return false;
    });
    if (index != -1) {
      _navigatorPages = [..._navigatorPages, MaterialPage(name: path, child: pages[index].builder(data))];
      notifyListeners();
    }
  }

  @override
  Uri? get currentConfiguration => Uri.parse(_navigatorPages.last.name ?? '');

  @override
  GlobalKey<NavigatorState> get navigatorKey => GlobalKey<NavigatorState>();
}

class MyRouterInformationParser extends RouteInformationParser<Uri> {
  @override
  Future<Uri> parseRouteInformation(RouteInformation routeInformation) {
    return Future.value(Uri.parse(routeInformation.uri.toString()));
  }

  @override
  RouteInformation? restoreRouteInformation(Uri configuration) {
    return RouteInformation(uri: Uri.parse(configuration.toString()));
  }
}
 */
