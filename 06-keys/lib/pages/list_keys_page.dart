import 'package:flutter/material.dart';
import 'package:keys/widgets/counter_button.dart';

class ListKeysPage extends StatefulWidget {
  const ListKeysPage({Key? key}) : super(key: key);

  @override
  State<ListKeysPage> createState() => _ListKeysPageState();
}

class _ListKeysPageState extends State<ListKeysPage> {
  bool _enabledEmail = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Switch(
            value: _enabledEmail,
            onChanged: (v) {
              setState(() => _enabledEmail = v);
            },
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          if (_enabledEmail) const Text('data1'),
          const Text('data2'),
          if (_enabledEmail)
            const TextField(decoration: InputDecoration(label: Text('Correo'))),
          const TextField(
            key: Key('pwd'),
            decoration: InputDecoration(label: Text('Clave')),
          ),
          // if (_enabledEmail) const CounterButtonWidget(),
          const CounterButtonWidget(
            key: Key('counter1'),
          ),
          const CounterButtonWidget(
            key: Key('counter2'),
          ),
        ],
      ),
    );
  }
}
