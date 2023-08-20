import 'package:flutter/material.dart';

class ColorPickerPage extends StatelessWidget {
  const ColorPickerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: Colors.primaries.length,
        itemBuilder: (context, index) {
          final color = Colors.primaries[index];
          return GestureDetector(
            onTap: () => Navigator.pop(context, color),
            child: Container(
              height: 70,
              color: color,
            ),
          );
        },
      ),
    );
  }
}
