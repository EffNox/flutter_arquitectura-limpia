import 'package:flutter/material.dart';
import 'package:keys/widgets/counter_button.dart';

class MovablePage extends StatefulWidget {
  const MovablePage({Key? key}) : super(key: key);

  @override
  State<MovablePage> createState() => _MovablePageState();
}

class _MovablePageState extends State<MovablePage> {
  var _inbody = true;
  final gKey = GlobalKey<CounterButtonWidgetState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: !_inbody ? CounterButtonWidget(key: gKey) : null,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
          icon: const Icon(Icons.menu),
          color: Colors.black,
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Funciona pero no es lo más óptimo, es mejor poner en pública la clase
              // (gKey.currentState as dynamic).reset();

              // Con clase pública pero mucho código, mejor ponerle en el GlobalKey el tipo de clase a manejar
              // (gKey.currentState as CounterButtonWidgetState).reset();

              gKey.currentState!.reset();
              // final cState = gKey.currentState;
              // debugPrint('cState 🤝: $cState');
            },
            child: const Text('Reset'),
          ),
          Switch(
            value: _inbody,
            onChanged: (v) {
              setState(() => _inbody = v);
            },
          )
        ],
      ),
      body: _inbody ? CounterButtonWidget(key: gKey) : null,
      drawerEdgeDragWidth: MediaQuery.of(context).size.width,
      drawer: const Drawer(
          // width: 500,
          ),
    );
  }
}
