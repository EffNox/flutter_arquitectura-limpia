import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  final double size;
  final String asset;
  final double border;
  const AvatarWidget({
    Key? key,
    required this.size,
    required this.asset,
    this.border = 0,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // return Center(
    //   child: ClipRRect(
    //     borderRadius: BorderRadius.circular(size * .5),
    //     child: Image.asset(
    //       asset,
    //       height: size,
    //       width: size,
    //     ),
    //   ),
    // );
    final fromNetwork = asset.startsWith('http');
    // final imageProvider = fromNetwork ? NetworkImage(asset) : AssetImage(asset);
    final imageProvider =
        fromNetwork ? CachedNetworkImageProvider(asset) : AssetImage(asset);
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: border),
        image: DecorationImage(
          image: imageProvider as ImageProvider,
          fit: BoxFit.cover,
        ),
      ),
      // child: Image.asset(asset),
    );
  }
}
