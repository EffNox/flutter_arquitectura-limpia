import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ColorPage extends StatelessWidget {
  const ColorPage({Key? key, required this.color, required this.colorName, this.showAppBar = true}) : super(key: key);
  final MaterialColor color;
  final String colorName;
  final bool showAppBar;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (showAppBar)
          AppBar(
            backgroundColor: color,
            title: Text(colorName),
            centerTitle: true,
          ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: 9,
            itemBuilder: (_, index) {
              final shade = 100 * index + 100;
              final variant = color[shade]!;
              return InkWell(
                onTap: () {
                  final location = context.namedLocation(colorName.toLowerCase());
                  context.push('$location/$shade');
                },
                child: Container(height: 150, color: variant),
              );
            },
          ),
        )
      ],
    );
  }
}
