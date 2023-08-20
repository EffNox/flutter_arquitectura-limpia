import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 30;

  final _textKey = GlobalKey();
  final _safeAreaKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    // final mediaQuery = context.findAncestorWidgetOfExactType<MediaQuery>();
    // final screenSize = mediaQuery!.data.size;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        key: _safeAreaKey,
        child: Center(
          // child: Text('${screenSize.width}x${screenSize.height}'),
          child: Text(
            '$_counter',
            key: _textKey,
            style: TextStyle(fontSize: _counter.toDouble()),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: _increment),
    );
  }

  void _increment() {
    _printTextSize();
    setState(() {
      _counter++;
    });
  }

  void _printTextSize() {
    final renderBox = _textKey.currentContext!.findRenderObject() as RenderBox;
    // final screenSize = context.screenSize;
    final position = renderBox.localToGlobal(
      Offset.zero,
      ancestor: _safeAreaKey.currentContext!.findRenderObject(),
      // Offset(
      //   -screenSize.width * 0.5,
      //   -screenSize.height * 0.5,
      // ),
    );
    debugPrint('position: $position');

    // debugPrint('x ${position.dx - screenSize.width * 0.5}');
    // debugPrint('y ${position.dy - screenSize.height * 0.5}');
    debugPrint('renderBox: ${renderBox.size}');
  }
}
