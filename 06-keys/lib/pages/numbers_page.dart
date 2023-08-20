import 'package:flutter/material.dart';

class NumbersPage extends StatefulWidget {
  const NumbersPage({Key? key}) : super(key: key);

  @override
  State<NumbersPage> createState() => _NumbersPageState();
}

class _NumbersPageState extends State<NumbersPage> {
  final List<int> _numbers = [];

  @override
  void initState() {
    super.initState();
    _numbers.addAll(List.generate(100, (index) => index));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ReorderableListView.builder(
        physics: const BouncingScrollPhysics(),
        onReorder: (oldIndex, newIndex) {
          if (oldIndex < newIndex) newIndex--;
          _numbers.insert(newIndex, _numbers.removeAt(oldIndex));
        },
        itemCount: _numbers.length,
        itemBuilder: (_, i) {
          final value = _numbers[i];
          return ListTile(
            key: ValueKey(value),
            title: Text('$value', style: const TextStyle(fontSize: 30)),
          );
        },
      ),
    );
  }
}
