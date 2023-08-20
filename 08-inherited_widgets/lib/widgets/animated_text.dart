import 'package:flutter/material.dart';
import 'package:inherited_widgets/pages/home_page.dart';

class AnimatedTextWidget extends StatelessWidget {
  const AnimatedTextWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // debugPrint('animated: Text');
    final homeProvider = HomePageProvider.of(context);

    return Center(
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: Text(
          '${homeProvider.counter}',
          key: UniqueKey(),
          style: const TextStyle(fontSize: 50, color: Colors.white),
        ),
      ),
    );
  }
}
