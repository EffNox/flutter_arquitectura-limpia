import 'package:flutter/material.dart';

class CounterButtonWidget extends StatefulWidget {
  const CounterButtonWidget({Key? key}) : super(key: key);

  @override
  State<CounterButtonWidget> createState() => CounterButtonWidgetState();
}

class CounterButtonWidgetState extends State<CounterButtonWidget> {
  int _counter = 0;

  void reset() {
    setState(() => _counter = 0);
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          setState(() {
            _counter++;
          });
        },
        child: Text(
          '$_counter',
          style: const TextStyle(fontSize: 35),
        ));
  }
}
