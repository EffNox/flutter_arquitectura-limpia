import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../global/controllers/favorites/favorites_controller.dart';
import '../../../global/controllers/favorites/widgets/favorites_app_bar.dart';
import '../../../global/controllers/favorites/widgets/favorites_content.dart';
import '../../../global/widgets/request_failed.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> with SingleTickerProviderStateMixin {
  late final TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final FavoritesController controller = context.watch();
    return Scaffold(
      appBar: FavoritesAppBarWidget(controller: _controller),
      body: controller.state.map(
        loading: (_) => const Center(child: CircularProgressIndicator()),
        failed: (_) => RequestFailedWidget(onRetry: controller.init),
        loaded: (value) => FavoritesContentWidget(state: value, controller: _controller),
      ),
    );
  }
}
