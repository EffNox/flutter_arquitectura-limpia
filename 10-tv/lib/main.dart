import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_strategy/url_strategy.dart';

import 'app/app.dart';
import 'app/data/http/http.dart';
import 'app/data/repositories_implementation/account_repository_impl.dart';
import 'app/data/repositories_implementation/authentication_repository_impl.dart';
import 'app/data/repositories_implementation/connectivity_repository_impl.dart';
import 'app/data/repositories_implementation/movies_repository_impl.dart';
import 'app/data/repositories_implementation/preferences_repositoty_impl.dart';
import 'app/data/repositories_implementation/trending_repository_imp.dart';
import 'app/data/services/local/session_service.dart';
import 'app/data/services/remote/account_api.dart';
import 'app/data/services/remote/authentication_api.dart';
import 'app/data/services/remote/internet_checker.dart';
import 'app/data/services/remote/movies_api.dart';
import 'app/data/services/remote/trending_api.dart';
import 'app/domain/repositories/account_repository.dart';
import 'app/domain/repositories/authentication_repository.dart';
import 'app/domain/repositories/connectivity_repository.dart';
import 'app/domain/repositories/movies_repository.dart';
import 'app/domain/repositories/preferences_repository.dart';
import 'app/domain/repositories/trending_repository.dart';
import 'app/generated/translations.g.dart';
import 'app/presentation/global/controllers/favorites/favorites_controller.dart';
import 'app/presentation/global/controllers/favorites/state/favorites_state.dart';
import 'app/presentation/global/controllers/session_controller.dart';
import 'app/presentation/global/controllers/theme_controller.dart';

void main() async {
  setPathUrlStrategy();
  final isDarkModeSystemEnabled = WidgetsFlutterBinding.ensureInitialized().platformDispatcher.platformBrightness == Brightness.dark;
  LocaleSettings.useDeviceLocale();
  Intl.defaultLocale = LocaleSettings.currentLocale.languageTag;

  final sessionService = SessionService(const FlutterSecureStorage());
  final http = Http(client: Client(), api: 'https://api.themoviedb.org/3', apiKey: '117119b8381f41b4a889648b6d83078f');
  final accountApi = AccountAPI(http, sessionService);

  final preferences = await SharedPreferences.getInstance();

  final connectivity = ConnectivityRepositoryImpl(Connectivity(), InternetChecker());
  await connectivity.initialize();

  runApp(
    MultiProvider(
      providers: [
        Provider<ConnectivityRepository>(create: (_) => connectivity),
        Provider<PreferencesRepository>(create: (_) => PreferencesRepositoryImpl(preferences)),
        Provider<AuthenticationRepository>(
          create: (_) => AuthenticationRepositoryImpl(AuthenticationApi(http), sessionService, accountApi),
        ),
        Provider<AccountRepository>(create: (_) => AccountRepositoryImpl(accountApi, sessionService)),
        Provider<TrendingRepository>(create: (_) => TrendingRepositoryImpl(TrendingAPI(http))),
        Provider<MoviesRepository>(create: (_) => MoviesRepositoryImpl(MoviesAPI(http))),
        //
        ChangeNotifierProvider<ThemeController>(create: (ctx) {
          return ThemeController(
            ctx.read<PreferencesRepository>().darkMode ?? isDarkModeSystemEnabled,
            preferencesRepository: ctx.read(),
          );
        }), // THEME
        ChangeNotifierProvider<SessionController>(create: (ctx) => SessionController(authenticationRepository: ctx.read())),
        ChangeNotifierProvider<FavoritesController>(create: (ctx) => FavoritesController(FavoritesState.loading(), accountRepository: ctx.read())),
      ],
      child: TranslationProvider(child: const AppPage()),
    ),
  );
}
