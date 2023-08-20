import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'color_page.dart';

class ColorDetailPage extends StatelessWidget {
  static GoRoute getRoute(MaterialColor color) {
    return GoRoute(
      path: ':shade',
      builder: (context, state) {
        final shade = int.parse(state.pathParameters['shade']!);
        return ColorDetailPage(materialColor: color, shade: shade);
      },
    );
  }

  const ColorDetailPage({
    Key? key,
    required this.materialColor,
    required this.shade,
  }) : super(key: key);
  final MaterialColor materialColor;
  final int shade;

  @override
  Widget build(BuildContext context) {
    final uri = GoRouter.of(context).routerDelegate.currentConfiguration.uri;
    return Column(
      children: [
        AppBar(backgroundColor: materialColor[shade]),
        Expanded(child: Container(color: materialColor[shade])),
        Expanded(
            child: ColorPage(
          color: materialColor,
          colorName: uri.pathSegments.first,
          showAppBar: false,
        )),
      ],
    );
  }
}
