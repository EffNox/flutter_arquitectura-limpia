import 'package:flutter/material.dart';
import 'package:i18n/app/my_app.dart';
import 'package:i18n/app/number_symbols_ext.dart';
import 'package:i18n/translations.g.dart';
import 'package:intl/number_symbols.dart';
import 'package:intl/number_symbols_data.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // final locale = WidgetsFlutterBinding.ensureInitialized().platformDispatcher.locale;
  LocaleSettings.useDeviceLocale(); // no funciona, en teoría usa el idioma local del dispositivo
  // debugPrint('locale: $locale');

  // Intl.defaultLocale = 'es_PE';
  // Intl.defaultLocale = locale.toString();
  // initializeDateFormatting('es_PE', null);

  final esES = numberFormatSymbols['es_ES'] as NumberSymbols;
  final enUS = numberFormatSymbols['en_US'] as NumberSymbols;

  numberFormatSymbols['es_ES'] = esES.copyWith(currencySymbol: '€');
  numberFormatSymbols['en_US'] = enUS.copyWith(currencySymbol: r'$');

  numberFormatSymbols['es_PE'] = enUS.copyWith(currencySymbol: 'S/.');

  runApp(TranslationProvider(child: const MyApp()));
}
