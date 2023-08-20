import 'package:flutter/material.dart';
import 'package:inherited_widgets/global/theme_controller.dart';
import 'package:inherited_widgets/state_management/provider.dart';
import 'package:inherited_widgets/widgets/counter_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _counter = 0;
  final Color _color = Colors.blue;
  double _fontSize = 30.0;

  @override
  Widget build(BuildContext context) {
    final themeController = Provider.of<ThemeController>(context);
    debugPrint('themeController: ${themeController.hashCode}');

    return Scaffold(
      appBar: AppBar(
        actions: [
          Switch(
            value: themeController.isDarkModeEnabled,
            activeColor: Colors.amberAccent,
            onChanged: (v) {
              themeController.toggleTheme();
            },
          ),
          IconButton(
            onPressed: () {
              setState(() {});
              _fontSize++;
            },
            icon: const Icon(Icons.font_download_outlined),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // CounterWidget(),
            HomePageProvider(
              counter: _counter,
              color: _color,
              child: const CounterWidget(),
            ),
            Text(_fontSize.toString(), style: TextStyle(fontSize: _fontSize)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
      ),
    );
  }

  void _incrementCounter() {
    setState(() {
      // _color =
      //     Colors.primaries[math.Random().nextInt(Colors.primaries.length - 1)];
      _counter++;
    });
  }
}

class HomePageProvider extends InheritedWidget {
  final int counter;
  final Color color;

  const HomePageProvider({
    Key? key,
    required this.counter,
    required this.color,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(HomePageProvider oldWidget) {
    // debugPrint('oldWidget: ${oldWidget.counter}');
    // debugPrint('counter: $counter');
    return oldWidget.counter != counter || oldWidget.color != color;
  }

  static HomePageProvider of(BuildContext context) {
    final provider =
        context.dependOnInheritedWidgetOfExactType<HomePageProvider>();
    assert(provider != null,
        'Invalid context, could not fiend a HomePageProvider with th passed context');

    return provider!;
  }
}
