import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../domain/models/movie.dart';
import '../../../../global/extensions/build_context_ext.dart';
import '../../../../global/utils/get_image_url.dart';

class MovieHeaderWidget extends StatelessWidget {
  const MovieHeaderWidget({Key? key, required this.movie}) : super(key: key);
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AspectRatio(
          aspectRatio: 16 / 13,
          child: movie.backdropPath != null
              ? CachedNetworkImage(
                  imageUrl: getImageUrl(movie.backdropPath!, imageQuality: ImageQuality.original),
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                )
              : Container(color: Colors.black54),
        ),
        Positioned(
          left: 0,
          bottom: 0,
          right: 0,
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black54,
                  Colors.black,
                ],
              ),
            ),
            padding: const EdgeInsets.all(15).copyWith(top: 25),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title,
                        style: context.textTheme.titleMedium?.copyWith(color: Colors.white, fontSize: 20),
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 10,
                        children: movie.genres
                            .map((e) => Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(border: Border.all(color: Colors.white), borderRadius: BorderRadius.circular(5)),
                                  child: Text(e.name, style: const TextStyle(color: Colors.white)),
                                ))
                            .toList(),
                      )
                    ],
                  ),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 70,
                      height: 70,
                      child: CircularProgressIndicator(value: (movie.voteAverage / 10).clamp(0, 1)),
                    ),
                    Positioned(
                      child: Text(
                        movie.voteAverage.toStringAsFixed(1),
                        style: context.textTheme.titleLarge,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
