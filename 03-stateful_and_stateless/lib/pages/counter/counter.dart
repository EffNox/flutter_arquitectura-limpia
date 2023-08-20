import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  final int initialValue;

  const CounterPage({Key? key, this.initialValue = 0}) : super(key: key);

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  late int counter;
  String name = '';

  @override
  void initState() {
    super.initState();
    counter = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('$counter', style: const TextStyle(fontSize: 50)),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_outlined),
        onPressed: () {
          name = 'Fernando';
          counter++;
          setState(() {});
        },
      ),
    );
  }
}
