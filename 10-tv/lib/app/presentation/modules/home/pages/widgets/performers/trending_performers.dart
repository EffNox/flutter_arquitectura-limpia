import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../global/widgets/request_failed.dart';
import '../../../controllers/home_controller.dart';
import '../../../controllers/state/home_state.dart';
import 'performer_tile.dart.dart';

class TrendingPerformersWidget extends StatefulWidget {
  const TrendingPerformersWidget({super.key});

  @override
  State<TrendingPerformersWidget> createState() => _TrendingPerformersWidgetState();
}

class _TrendingPerformersWidgetState extends State<TrendingPerformersWidget> {
  final _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final HomeController controller = context.watch();
    final performers = controller.state.performers;

    return Expanded(
      child: performers.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        failed: () => RequestFailedWidget(onRetry: () {
          controller.loadPerformers(performers: const PerformersState.loading());
        }),
        loaded: (lst) => Stack(
          alignment: Alignment.center,
          children: [
            PageView.builder(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              itemCount: lst.length,
              itemBuilder: (_, i) => TrendingPerformerTileWidget(performer: lst[i]),
            ),
            Positioned(
              bottom: 18,
              child: AnimatedBuilder(
                animation: _pageController,
                builder: (_, __) {
                  final currentCard = (_pageController.page?.toInt() ?? 0);
                  return Row(
                    children: List.generate(
                        lst.length, (i) => Icon(Icons.circle_rounded, color: currentCard == i ? Colors.white : Colors.white30, size: 15)),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
