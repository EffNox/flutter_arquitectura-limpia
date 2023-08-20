import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../global/widgets/request_failed.dart';
import '../../../controllers/home_controller.dart';
import '../../../controllers/state/home_state.dart';
import 'trending_tile.dart';
import 'trending_time_window.dart';

class TrendingListWidgetState extends StatelessWidget {
  const TrendingListWidgetState({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = context.watch();
    final moviesAndSeries = controller.state.moviesAndSeries;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TrendingTimeWindowWidget(
          timeWindow: moviesAndSeries.timeWindow,
          onChanged: controller.onTimeWindowChanged,
        ),
        const SizedBox(height: 10),
        AspectRatio(
          aspectRatio: 16 / 8,
          child: LayoutBuilder(
            builder: (_, constraints) {
              final width = constraints.maxHeight * .75;
              return Center(
                child: moviesAndSeries.when(
                  loading: (_) => const CircularProgressIndicator(),
                  failed: (_) => RequestFailedWidget(onRetry: () {
                    controller.loadMoviesAndSeries(moviesAndSeries: MoviesAndSeriesState.loading(moviesAndSeries.timeWindow));
                  }),
                  loaded: (_, lst) => ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    scrollDirection: Axis.horizontal,
                    itemCount: lst.length,
                    itemBuilder: (context, index) => TrendingTileWidget(media: lst[index], width: width),
                    separatorBuilder: (_, __) => const SizedBox(width: 10),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
