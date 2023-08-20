import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({Key? key}) : super(key: key);

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _value = 0;
  double _value2 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Slider(
              value: _value2,
              label: '$_value2',
              min: 0,
              max: 10,
              divisions: 10,
              onChanged: (v) {
                setState(() => _value2 = v.truncateToDouble());
              },
              onChangeStart: (_) {
                debugPrint('Start 🤝');
              },
              onChangeEnd: (_) {
                debugPrint('End 🤝');
              },
            ),
            Row(
              children: [
                const SizedBox(width: 60),
                SizedBox(
                  height: 400,
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: SliderTheme(
                      data: const SliderThemeData(trackHeight: 4),
                      child: Slider(
                        value: _value,
                        label: '$_value',
                        min: 0,
                        max: 100,
                        divisions: 100,
                        thumbColor: Colors.amber,
                        onChanged: (v) {
                          setState(() => _value = v.truncateToDouble());
                        },
                      ),
                    ),
                  ),
                ),
                const Text('Hoa')
              ],
            ),
          ],
        ),
      )),
    );
  }
}
