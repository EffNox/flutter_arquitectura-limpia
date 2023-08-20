import 'package:flutter/material.dart';
import 'package:inherited_widgets/pages/home_page.dart';
import 'package:inherited_widgets/widgets/animated_text.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // debugPrint('counter: Text');
    final homeProvider = HomePageProvider.of(context);

    return Center(
      child: Container(
        height: 100,
        width: 100,
        decoration:
            BoxDecoration(color: homeProvider.color, shape: BoxShape.circle),
        child: const AnimatedTextWidget(),
      ),
    );
  }
}
