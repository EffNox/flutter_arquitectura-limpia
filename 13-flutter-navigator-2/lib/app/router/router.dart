import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../global/session_controller.dart';
import '../my_app.dart';
import '../pages/colors/color_detail_page.dart';
import '../pages/colors/color_page.dart';
import '../pages/colors/widgets/colors_scaffold.dart';
import '../pages/home/home_view.dart';
import '../pages/home/product_view.dart';
import '../pages/home/widgets/scaffold.dart';
import '../pages/profile_view.dart';
import '../pages/sign_in_view.dart';
import 'routes.dart';

mixin RouterMixin on State<MyApp> {
  GoRouter? _router;
  final rootNavigatorKey = GlobalKey<NavigatorState>();

  GoRouter get router {
    _router ??= GoRouter(
      initialLocation: '/red',
      // errorBuilder: (_, st) => const Scaffold(body: Center(child: Text('No encontrado'))),
      navigatorKey: rootNavigatorKey,
      routes: [
        ShellRoute(
          builder: (_, __, child) => ColorsScaffoldWidget(child: child),
          routes: [
            GoRoute(
                name: Routes.red,
                path: '/red',
                builder: (_, state) => const ColorPage(color: Colors.red, colorName: 'RED'),
                routes: [ColorDetailPage.getRoute(Colors.red)]),
            GoRoute(
                name: Routes.green,
                path: '/green',
                builder: (_, state) => const ColorPage(color: Colors.green, colorName: 'GREEN'),
                routes: [ColorDetailPage.getRoute(Colors.green)]),
            GoRoute(
                name: Routes.blue,
                path: '/blue',
                builder: (_, state) => const ColorPage(color: Colors.blue, colorName: 'BLUE'),
                routes: [ColorDetailPage.getRoute(Colors.blue)]),
          ],
        ),
        //
        ShellRoute(
          builder: (context, state, child) => HomeScaffoldWidget(child: child),
          routes: [
            GoRoute(name: Routes.home, path: '/', builder: (_, __) => const HomeView()),
            GoRoute(
              name: Routes.product,
              path: '/product/:id',
              builder: (_, st) {
                final id = int.parse(st.pathParameters['id']!);
                return ProductView(id: id);
              },
              redirect: (ctx, st) => authGuard(ctx: ctx, st: st, callbackUrl: '/product/${st.pathParameters['id']}'),
            ),
          ],
        ),
        GoRoute(
          name: Routes.signin,
          path: '/sign-in',
          parentNavigatorKey: rootNavigatorKey,
          builder: (_, st) {
            final callbackUrl = st.uri.queryParameters['callbackUrl'] ?? '/';
            return SignInPage(callbackUrl: callbackUrl);
          },
          redirect: (ctx, _) {
            final isSignedIn = ctx.read<SessionController>().isSignedIn;
            return (isSignedIn) ? '/' : null;
          },
        ),
        GoRoute(
          name: Routes.profile,
          path: '/profile',
          parentNavigatorKey: rootNavigatorKey,
          builder: (_, __) => const ProfilePage(),
          redirect: (ctx, st) => authGuard(ctx: ctx, st: st, callbackUrl: '/profile'),
        ),
      ],
      debugLogDiagnostics: true,
    );

    return _router!;
  }
}

FutureOr<String?> authGuard({required BuildContext ctx, required GoRouterState st, required String callbackUrl}) async {
  final isSignedIn = ctx.read<SessionController>().isSignedIn;
  if (isSignedIn) {
    // await Future.delayed(const Duration(seconds: 3));
    return null;
  }
  return '/sign-in?callbackUrl=$callbackUrl';
}
