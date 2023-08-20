import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../../domain/models/performer.dart';
import '../../../../../global/utils/get_image_url.dart';
import '../movies_and_series/trending_tile.dart';

class TrendingPerformerTileWidget extends StatelessWidget {
  final Performer performer;
  const TrendingPerformerTileWidget({Key? key, required this.performer}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            Positioned.fill(
              child: CachedNetworkImage(
                imageUrl: getImageUrl(performer.profilePath, imageQuality: ImageQuality.original),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
                bottom: 6,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.transparent, Colors.black87],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(performer.name, style: const TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
                      if (performer.knownFor.isNotEmpty)
                        SizedBox(
                          height: 130,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: performer.knownFor.take(3).map((e) => TrendingTileWidget(media: e, width: 150 * .75, showData: false)).toList(),
                          ),
                        )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
