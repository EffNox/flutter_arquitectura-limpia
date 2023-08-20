import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../global/widgets/request_failed.dart';
import '../controllers/movie_controller.dart';
import '../state/movie_state.dart';
import 'widgets/movie_app_bar.dart';
import 'widgets/movie_content.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({Key? key, required this.movieId}) : super(key: key);
  final int movieId;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MovieController(MovieState.loading(), id: movieId, moviesRepository: context.read())..init(),
      builder: (context, _) {
        final MovieController controller = context.watch();

        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: const MovieAppBarWidget(),
          body: controller.state.mapOrNull(
            loading: (_) => const Center(child: CircularProgressIndicator()),
            failed: (_) => RequestFailedWidget(onRetry: controller.init),
            loaded: (state) => MovieContentWidget(state: state),
          ),
        );
      },
    );
  }
}
