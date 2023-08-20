import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../global/controllers/favorites/favorites_controller.dart';
import '../../../../utils/mark_as_favorite.dart';
import '../../controllers/movie_controller.dart';

class MovieAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const MovieAppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MovieController movieController = context.watch();
    final FavoritesController favoritesController = context.watch();
    return AppBar(
      backgroundColor: Colors.transparent,
      iconTheme: const IconThemeData(color: Colors.white),
      actions: movieController.state.map(
        loading: (_) => null,
        failed: (_) => null,
        loaded: (movieState) => [
          favoritesController.state.maybeMap(
            loaded: (favoritesState) => IconButton(
              icon: Icon(
                favoritesState.movies.containsKey(movieState.movie.id) ? Icons.favorite : Icons.favorite_outline,
                color: Colors.white,
                weight: 200,
              ),
              onPressed: () => markAsFavorite(
                context: context,
                media: movieState.movie.toMedia(),
                mounted: () => movieController.mounted,
              ),
            ),
            orElse: SizedBox.shrink,
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
