import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../../domain/models/media.dart';
import '../../../../../global/utils/get_image_url.dart';
import '../../../../../utils/go_to_media_details.dart';

class TrendingTileWidget extends StatelessWidget {
  final Media media;
  final double width;
  final bool showData;
  const TrendingTileWidget({Key? key, required this.media, required this.width, this.showData = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => goToMediaDetails(context, media),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: SizedBox(
          width: width,
          child: Stack(
            children: [
              Positioned.fill(
                // child: ExtendedImage.network(
                //   getImageUrl(media.posterPath),
                //   fit: BoxFit.cover,
                //   centerSlice: Rect.fromCircle(center: const Offset(1, 1), radius: 2.5),
                //   loadStateChanged: (state) {
                //     if (state.extendedImageLoadState == LoadState.loading) return Container(color: Colors.black12);
                //     return state.completedWidget;
                //   },
                // ),
                child: CachedNetworkImage(
                  imageUrl: getImageUrl(media.posterPath),
                  fit: BoxFit.cover,
                ),
              ),
              if (showData)
                Positioned(
                  top: 5,
                  right: 5,
                  child: Opacity(
                    opacity: 0.7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Chip(
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          padding: const EdgeInsets.all(0),
                          visualDensity: const VisualDensity(horizontal: -1, vertical: -1),
                          label: Text(
                            media.voteAverage.toStringAsFixed(1),
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Chip(
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          padding: const EdgeInsets.all(0),
                          visualDensity: const VisualDensity(horizontal: -1, vertical: -1),
                          label: Icon(media.type == MediaType.movie ? Icons.movie_rounded : Icons.tv_outlined),
                        )
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
