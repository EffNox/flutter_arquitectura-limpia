import 'package:flutter/material.dart';

import '../../state/movie_state.dart';
import 'movie_cast.dart';
import 'movie_header.dart';

class MovieContentWidget extends StatelessWidget {
  const MovieContentWidget({super.key, required this.state});

  final MovieStateLoaded state;

  @override
  Widget build(BuildContext context) {
    final movie = state.movie;

    return SingleChildScrollView(
      child: Column(
        children: [
          MovieHeaderWidget(movie: movie),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(movie.overview),
          ),
          MovieCastWidget(movieId: movie.id),
        ],
      ),
    );
  }
}
