import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImagesPage extends StatelessWidget {
  const ImagesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 350,
          height: 500,
          color: Colors.grey,

          /* IMAGEN LOCAL */
          // child: Image.asset(
          //   'assets/images/goku.png',
          //   // height: 100,
          //   // width: 300,
          //   // height: double.infinity,
          //   // fit: BoxFit.fill,
          // ),

          /* IMAGEN DE INTERNET */
          // child: Image.network(
          //   'https://www.pixelstalk.net/wp-content/uploads/images5/Goku-4K-Wallpaper-HD-for-Desktop.jpg',
          //   loadingBuilder: (_, child, loadingProgress) {
          //     if (loadingProgress == null) return child;
          //     return const Center(
          //       child: CircularProgressIndicator(
          //         strokeWidth: 6,
          //         color: Colors.white,
          //       ),
          //     );
          //   },
          // ),

          /* IMAGEN DE INTERNET CON CACHE */
          child: CachedNetworkImage(
            imageUrl:
                'https://www.pixelstalk.net/wp-content/uploads/images5/Goku-4K-Wallpaper-HD-for-Desktop.jpg',
            placeholder: (_, __) => const Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (_, __, ___) => const Icon(Icons.error_outline),
          ),
        ),
      ),
    );
  }
}
