import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScaffoldWidget extends StatelessWidget {
  const ScaffoldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        // systemOverlayStyle: const SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: const Color(0xff004d8f),
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 26),
        // elevation: 10,
        // shadowColor: Colors.yellow,
        title: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Flutter '),
            Text('App', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.logout_outlined)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.settings_outlined)),
        ],
      ),

      // resizeToAvoidBottomInset:false, // Ocultar el botón flotante y texto y no elevarlo
      body: Container(
        color: Colors.grey,
        // alignment: Alignment.center,
        width: double.infinity,
        height: double.infinity,
        child: const Column(
          children: [
            Expanded(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: TextField(),
                ),
              ),
            ),
            Text('data asd asdas d'),
            SizedBox(height: 50),
          ],
        ),
      ),
      // extendBodyBehindAppBar: true, // el body detrás del AppBar
      // extendBody: true, // detrás del BootomNavigationBar

      /* CAJÓN DESPLEGABLE */
      drawerEdgeDragWidth: 100, // Ancho de captura de drag
      // endDrawerEnableOpenDragGesture: false,
      // drawerEnableOpenDragGesture: false,
      drawer: const Drawer(),
      /* endDrawer: const Drawer(
        elevation: 0,
        child: Column(
          children: [
            Text(
              'test@test.com',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ), */
      onDrawerChanged: (isOpenedLeft) =>
          debugPrint('isOpenedLeft: $isOpenedLeft'),
      onEndDrawerChanged: (isOpenedRight) =>
          debugPrint('isOpenedRight: $isOpenedRight'),

      /* BOTÓN FLOTANTE */
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_outlined, size: 45),
        onPressed: () => debugPrint('🤝'),
      ),

      /* Barra de Navegación baja  */
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Person',
            icon: Icon(Icons.person_outline),
          ),
        ],
      ),
    );
  }
}
