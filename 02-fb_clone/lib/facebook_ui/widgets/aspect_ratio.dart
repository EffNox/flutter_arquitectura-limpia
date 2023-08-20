import 'package:flutter/material.dart';

class AspectRatioPage extends StatelessWidget {
  const AspectRatioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InteractiveViewer(
          // maxScale: 5.0,
          // minScale: 0.01,
          // boundaryMargin: const EdgeInsets.all(double.infinity),
          // child: Image.asset(
          //   'assets/images/publications/ferrari.jpeg',
          //   height: 200,
          //   width: double.infinity,
          //   fit: BoxFit.cover,
          // ),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.network(
              'https://wallpaperaccess.com/full/3078924.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
