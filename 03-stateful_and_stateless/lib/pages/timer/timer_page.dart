import 'dart:async';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showTimer = true;

  Color _color = Colors.primaries.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            if (showTimer) TimerView(color: _color),
            Expanded(
                child: ListView.builder(
              itemCount: Colors.primaries.length,
              itemBuilder: (_, i) {
                final color = Colors.primaries[i];
                return GestureDetector(
                  onTap: () {
                    _color = color;
                    setState(() {});
                  },
                  child: Container(height: 50, color: color),
                );
              },
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showTimer = !showTimer;
          debugPrint('showTimer: $showTimer');
          setState(() {});
        },
      ),
    );
  }
}

class TimerView extends StatefulWidget {
  final Color color;
  const TimerView({Key? key, required this.color}) : super(key: key);

  @override
  State<TimerView> createState() => _TimerViewState();
}

class _TimerViewState extends State<TimerView> {
  int _time = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    debugPrint('🤙');
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => setState(() {
        _time++;
        setState(() {});
        // if (_time >= 10) timer.cancel();
      }),
    );
  }

  // CUANDO HAYA CAMBIOS EN LAS VARIABLES DEL WIDGET
  @override
  void didUpdateWidget(covariant TimerView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.color != widget.color) {
      debugPrint('Color Diferente 😎🤙');
      _time = 0;
    }
    debugPrint('Old: ${oldWidget.color}');
    debugPrint('Current: ${widget.color}');
  }

  @override
  void dispose() {
    debugPrint('dispose: ');
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('TimerBuild:');
    return Text(
      'TimerPage $_time',
      style: TextStyle(fontSize: 60, color: widget.color),
    );
  }
}
