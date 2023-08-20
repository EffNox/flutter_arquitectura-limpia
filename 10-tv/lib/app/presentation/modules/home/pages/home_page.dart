import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../global/widgets/my_scaffold.dart';
import '../../../routes/routes.dart';
import '../controllers/home_controller.dart';
import '../controllers/state/home_state.dart';
import 'widgets/movies_and_series/trending_list.dart';
import 'widgets/performers/trending_performers.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final languageCode = Localizations.localeOf(context).languageCode; //Para actualizar (escuchas cambios del dispositivo) en tiempo real el idioma
    return ChangeNotifierProvider(
      key: Key('home-$languageCode'),
      create: (context) => HomeController(HomeState(), trendingRepository: context.read())..init(),
      child: ScaffoldPage(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () => context.pushNamed(Routes.favorites),
              icon: const Icon(Icons.favorite),
            ),
            IconButton(
              onPressed: () => context.pushNamed(Routes.profile),
              icon: const Icon(Icons.person_2_outlined),
            ),
          ],
        ),
        body: SafeArea(
          child: LayoutBuilder(
            builder: (ctx, constraints) => RefreshIndicator(
              onRefresh: ctx.read<HomeController>().init,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: SizedBox(
                  height: constraints.maxHeight,
                  child: const Column(
                    children: [
                      SizedBox(height: 10),
                      TrendingListWidgetState(),
                      SizedBox(height: 20),
                      TrendingPerformersWidget(),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
