import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../domain/models/media.dart';
import '../../../../utils/go_to_media_details.dart';
import '../../../utils/get_image_url.dart';

class FavoritesList extends StatefulWidget {
  final List<Media> items;

  const FavoritesList({super.key, required this.items});

  @override
  State<FavoritesList> createState() => _FavoritesListState();
}

class _FavoritesListState extends State<FavoritesList> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView.separated(
      itemCount: widget.items.length,
      itemBuilder: (_, i) {
        final item = widget.items[i];
        return MaterialButton(
          padding: const EdgeInsets.all(8.0),
          onPressed: () => goToMediaDetails(context, item),
          child: Row(
            children: [
              ClipRRect(borderRadius: BorderRadius.circular(8), child: CachedNetworkImage(imageUrl: getImageUrl(item.posterPath), width: 60)),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      item.overview,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
      separatorBuilder: (_, __) => const Divider(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
