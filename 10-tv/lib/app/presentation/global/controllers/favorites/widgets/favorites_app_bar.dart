import 'package:flutter/material.dart';

class FavoritesAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const FavoritesAppBarWidget({Key? key, required this.controller}) : super(key: key);
  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      // titleTextStyle: const TextStyle(color: Colors.black),
      title: const Text('Favoritos'),
      // iconTheme: const IconThemeData(color: Colors.white),
      bottom: TabBar(
        // padding: const EdgeInsets.symmetric(vertical: 10),
        controller: controller,
        // indicator: const BoxDecoration(color: Colors.red),
        // indicator: const _Decoration(color: Colors.blue, width: 20),
        tabs: const [
          Tab(icon: Icon(Icons.movie)),
          Tab(icon: Icon(Icons.tv)),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 1.5);
}

// class _Decoration extends Decoration {
//   final Color color;
//   final double width;

//   const _Decoration({
//     required this.color,
//     required this.width,
//   });
//   @override
//   BoxPainter createBoxPainter([VoidCallback? onChanged]) => _Painter(color, width);
// }

// class _Painter extends BoxPainter {
//   final Color color;
//   final double width;

//   _Painter(this.color, this.width);

//   @override
//   void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
//     final size = configuration.size ?? Size.zero;
//     final paint = Paint()..color = color;
//     canvas.drawRRect(
//       RRect.fromRectAndRadius(
//         Rect.fromLTWH(
//           size.width * .5 + offset.dx - width * .5,
//           size.height * .9,
//           width,
//           width * .3,
//         ),
//         const Radius.circular(4),
//       ),
//       paint,
//     );
//     // canvas.drawCircle(Offset(size.width * .5 + offset.dx, size.height * .8), 4, paint);
//   }
// }
