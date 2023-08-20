import 'package:flutter/material.dart';

class AnimatedTextPage extends StatefulWidget {
  const AnimatedTextPage({Key? key}) : super(key: key);

  @override
  State<AnimatedTextPage> createState() => _AnimatedTextPageState();
}

class _AnimatedTextPageState extends State<AnimatedTextPage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedSwitcher(
          transitionBuilder: (child, animation) {
            // return FadeTransition(opacity: animation, child: child);
            return ScaleTransition(scale: animation, child: child);
          },
          duration: const Duration(milliseconds: 200),
          child: Text(
            '$_counter',
            // key: ValueKey(_counter),
            // key: ObjectKey(_counter),
            key: UniqueKey(),
            style: const TextStyle(fontSize: 25),
          ),
          // child: _counter % 2 == 0
          //     ? const CircularProgressIndicator()
          //     : Text(
          //         '$_counter',
          //         key: ValueKey<int>(_counter),
          //         style: const TextStyle(fontSize: 25),
          //       ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() => _counter++);
      }),
    );
  }
}
