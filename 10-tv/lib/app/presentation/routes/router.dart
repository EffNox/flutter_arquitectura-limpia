import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../app.dart';
import '../../domain/repositories/account_repository.dart';
import '../../domain/repositories/authentication_repository.dart';
import '../../domain/repositories/connectivity_repository.dart';
import '../global/controllers/favorites/favorites_controller.dart';
import '../global/controllers/session_controller.dart';
import '../modules/favorites/pages/favorites_page.dart';
import '../modules/home/pages/home_page.dart';
import '../modules/movie/pages/movie_page.dart';
import '../modules/offline/pages/offline.dart';
import '../modules/profile/pages/profile_page.dart';
import '../modules/sign_in/pages/sign_in_page.dart';
import 'routes.dart';

Future<String> getInitialRouteName(BuildContext context) async {
  final ConnectivityRepository connectivityRepository = context.read();
  final AuthenticationRepository authenticationRepository = context.read();
  final AccountRepository accountRepository = context.read();

  final SessionController sessionController = context.read();
  final FavoritesController favoritesController = context.read();

  final hasInternet = connectivityRepository.hasInternet;

  if (!hasInternet) return Routes.offline;

  final isSignedIn = await authenticationRepository.isSignedIn;
  if (!isSignedIn) return Routes.signIn;

  final user = await accountRepository.getUserData();

  if (user == null) return Routes.signIn;

  sessionController.setUser(user);
  favoritesController.init();

  return Routes.home;
}

mixin RouterMixin on State<AppPage> {
  GoRouter? _router;
  late String _initialRouteName;

  bool _loading = true;
  bool get loading => _loading;

  GoRouter get router {
    // if (_router != null) {
    //   return router!;
    // }

    final routes = [
      GoRoute(name: Routes.home, path: '/', builder: (_, __) => const HomePage()),
      GoRoute(name: Routes.signIn, path: '/signIn', builder: (_, __) => const SignInPage()),
      GoRoute(name: Routes.offline, path: '/offline', builder: (_, __) => const OfflinePage()),
      GoRoute(name: Routes.movie, path: '/movie/:id', builder: (_, st) => MoviePage(movieId: int.parse(st.pathParameters['id']!))),
      GoRoute(name: Routes.favorites, path: '/favorites', builder: (_, __) => const FavoritesPage()),
      GoRoute(name: Routes.profile, path: '/profile', builder: (_, __) => const ProfilePage()),
    ];

    final initialLocation = routes.firstWhere((e) => e.name == _initialRouteName, orElse: () => routes.first).path;

    _router ??= GoRouter(
      initialLocation: initialLocation,
      routes: routes,
      // errorBuilder: (context, state) => MaterialPageRoute(builder: (_) => Scaffold(body: Center(child: Assets.svgs.error404.svg()))),
    );
    return _router!;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _init();
    });
  }

  Future<void> _init() async {
    _initialRouteName = await getInitialRouteName(context);
    setState(() => _loading = false);
  }
}
