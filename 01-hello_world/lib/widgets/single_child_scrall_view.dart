import 'package:flutter/material.dart';

class SingleChildScrollViewWidget extends StatelessWidget {
  const SingleChildScrollViewWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final containerColors = List.generate(
      18,
      (index) => Container(
        height: 100,
        width: 100,
        color: Colors.primaries[index],
        alignment: Alignment.center,
        child: Text('$index'),
      ),
    );

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            SizedBox(
              height: 100,
              child: Row(
                children: [
                  const FlutterLogo(size: 90),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(8),
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      child: Row(
                        children: containerColors,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior
                    .onDrag, // ocultar el teclado al hacer scroll
                padding: const EdgeInsets.all(8),
                physics: const BouncingScrollPhysics(),
                reverse:
                    true, // que se muestre por primera vez al último de la lista
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextField(),
                    ),
                    ...containerColors,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
