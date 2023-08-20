import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:i18n/app/models/product.dart';
import 'package:i18n/app/pages/home/widgets/product_tile.dart';
import 'package:i18n/translations.g.dart';
import 'package:intl/intl.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final list = <Product>[];

  @override
  void initState() {
    super.initState();
    final faker = Faker();
    for (int i = 0; i < 50; i++) {
      list.add(
        Product(
          name: faker.food.dish(),
          image: faker.image.image(keywords: ['food']),
          price: faker.randomGenerator.decimal(min: 0.99, scale: 25100.0),
          rate: faker.randomGenerator.decimal(min: 1.0, scale: 5.0),
          releaseDate: faker.date.dateTime(minYear: 2020, maxYear: 2022),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // final t = Translations.of(context); NO ES NECESARIO PORQUE EN EL ARCHIVO SLANG SE CONFIGURO "translate_var" CON t por defecto
    // final txt = AppLocalizations.of(context)!;
    // final locale = WidgetsBinding.instance.platformDispatcher.locale;
    // final appState = context.findRootAncestorStateOfType<MyAppState>();

    return Scaffold(
      appBar: AppBar(
        title: Text(t.helloWorld),
        actions: [
          DropdownButton(
            underline: const SizedBox.shrink(),
            value: TranslationProvider.of(context).locale,
            items: const [
              DropdownMenuItem(
                value: AppLocale.en,
                child: Text('English'),
              ),
              DropdownMenuItem(
                value: AppLocale.es,
                child: Text('Español'),
              ),
              DropdownMenuItem(
                value: AppLocale.esPe,
                child: Text('Español Perú'),
              ),
            ],
            onChanged: (locale) {
              if (locale == null) return;
              LocaleSettings.setLocale(locale);
              Intl.defaultLocale = (locale.countryCode?.isNotEmpty ?? false) ? '${locale.languageCode}_${locale.countryCode}' : locale.languageCode;
            },
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 5, crossAxisSpacing: 5),
        itemBuilder: (_, index) => ProductTile(product: list[index]),
        itemCount: list.length,
      ),
    );
  }
}
