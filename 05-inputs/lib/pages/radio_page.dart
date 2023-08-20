import 'package:flutter/material.dart';

class RadioPage extends StatefulWidget {
  const RadioPage({Key? key}) : super(key: key);

  @override
  State<RadioPage> createState() => _RadioPageState();
}

class _RadioPageState extends State<RadioPage> {
  String? _better;
  String? _gender;

  void _onChanged(String? v) => setState(() => _better = v);
  void _onChangedGender(String? v) => setState(() => _gender = v);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          const Text('Witch is better?'),
          RadioListTile(
            value: 'flutter',
            contentPadding: EdgeInsets.zero,
            visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
            title: const Text('Flutter'),
            groupValue: _better,
            onChanged: _onChanged,
          ),
          RadioListTile(
            value: 'react native',
            contentPadding: EdgeInsets.zero,
            visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
            title: const Text('React Native'),
            groupValue: _better,
            onChanged: _onChanged,
          ),
          // Row(
          //   children: [
          //     Radio<String>(
          //       value: 'flutter',
          //       groupValue: _better,
          //       onChanged: (v) {
          //         setState(() => _better = v);
          //       },
          //     ),
          //     const Text('Flutter')
          //   ],
          // ),
          // Row(
          //   children: [
          //     Radio<String>(
          //       value: 'react native',
          //       groupValue: _better,
          //       onChanged: (v) {
          //         setState(() => _better = v);
          //       },
          //     ),
          //     const Text('React Native')
          //   ],
          // ),
          const Divider(),
          const Text('What is you gender?'),
          RadioListTile(
            value: 'flutter',
            contentPadding: EdgeInsets.zero,
            visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
            title: const Text('Male'),
            groupValue: _gender,
            onChanged: _onChangedGender,
          ),
          RadioListTile(
            value: 'react native',
            contentPadding: EdgeInsets.zero,
            visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
            title: const Text('Female'),
            activeColor: Colors.redAccent,
            groupValue: _gender,
            onChanged: _onChangedGender,
          ),
          RadioListTile(
            value: 'other',
            contentPadding: EdgeInsets.zero,
            visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
            title: const Text('Other'),
            groupValue: _gender,
            onChanged: _onChangedGender,
          ),
        ],
      ),
    );
  }
}
