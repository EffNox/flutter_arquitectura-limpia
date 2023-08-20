import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Hello World! kj asdka jsndklasjnd lksjnd alksd '
        'sakjdfnkasjdnfk asjdn  aslkdfal fsd f',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: Colors.white,
          // decoration: TextDecoration.underline,
          fontSize: 30,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
