import 'package:flutter/material.dart';

import '../state/favorites_state.dart';
import 'favorites_list.dart';

class FavoritesContentWidget extends StatelessWidget {
  final FavoritesStateLoaded state;
  final TabController controller;

  const FavoritesContentWidget({super.key, required this.state, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: controller,
      children: [
        FavoritesList(items: state.movies.values.toList()),
        FavoritesList(items: state.series.values.toList()),
      ],
    );
  }
}
