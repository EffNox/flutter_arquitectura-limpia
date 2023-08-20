import 'package:flutter/material.dart';

import '../icons/custom_icons_icons.dart';

// https://www.fluttericon.com/

class CustomIconPage extends StatelessWidget {
  const CustomIconPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              // Icons.alarm_add_outlined,
              // CupertinoIcons.add,
              CustomIcons.like,
              size: 400,
              color: Colors.blue,
              semanticLabel:
                  'icono reloj', // para persona de baja o nula visión
            ),
          ],
        ),
      ),
    );
  }
}
