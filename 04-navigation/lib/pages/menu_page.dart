import 'package:flutter/material.dart';
import 'package:navigation/routes.dart';

class PageData {
  final String name;
  final String label;
  final Object? args;
  final void Function(Object?)? onResult;

  const PageData(
      {required this.name, required this.label, this.args, this.onResult});
}

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  Color _color = Colors.redAccent;

  late final List<PageData> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      const PageData(
          name: Routes.login, label: 'Go to Login', args: 'asads@hotmail.com'),
      const PageData(name: Routes.counter, label: 'Go to Counter'),
      PageData(
        name: Routes.colorPicker,
        label: 'Go to Pick Color',
        onResult: (rs) {
          if (rs is Color) {
            _color = rs;
            setState(() {});
          }
        },
      ),
      const PageData(name: Routes.dialogs, label: 'Go to Dialogs'),
    ];
  }

  // void _onTap(BuildContext context) {
  //   final fk = Faker();
  //   final email = fk.internet.email();

  //   Navigator.pushNamed(context, Routes.login, arguments: email);

  //   // final route = MaterialPageRoute(
  //   //   builder: (_) => LoginPage(email: email),
  //   //   // settings: const RouteSettings(name: '/login'),
  //   // );
  //   // Navigator.push(context, route);
  //   // final route = MaterialPageRoute(
  //   //   builder: (_) => const LoginPage(),
  //   //   settings: RouteSettings(arguments: fk.internet.email()),
  //   // );
  //   // Navigator.push(context, route);
  //   // Navigator.pushReplacement(context, route);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.maybePop(context);
        //   },
        //   icon: const Icon(Icons.arrow_back_ios_new_outlined),
        // ),
        title: const Text('data'),
        centerTitle: true,
        backgroundColor: _color,
      ),
      body: ListView.builder(
        itemCount: _pages.length,
        itemBuilder: (_, i) {
          final pg = _pages[i];
          return ListTile(
            title: Text(pg.label),
            onTap: () async {
              final rs = await Navigator.pushNamed(context, pg.name,
                  arguments: pg.args);
              if (pg.onResult != null) pg.onResult!(rs);
            },
          );
        },
      ),
    );
  }
}


/* 

ListView(
        children: [
          ListTile(
            title: const Text('Go to login'),
            onTap: () => _onTap(context),
            trailing: const Icon(Icons.arrow_right_outlined, size: 60),
          ),
          ListTile(
            title: const Text('Go to Counter'),
            onTap: () => Navigator.pushNamed(context, Routes.counter),
            trailing: const Icon(Icons.arrow_right_outlined, size: 60),
          ),
          // Retornar valor seleccionado en Page
          ListTile(
            title: const Text('Go to Color Picker'),
            // onTap: () => Navigator.pushNamed(context, Routes.counter),
            onTap: () async {
              // final route = MaterialPageRoute<Color>(
              //     builder: (_) => const ColorPickerPage());
              // final result = await Navigator.push(context, route);
              final result =
                  await Navigator.pushNamed(context, Routes.colorPicker)
                      as Color?;

              // debugPrint('result: $result');
              if (result != null) setState(() => _color = result);
            },
            trailing: const Icon(Icons.arrow_right_outlined, size: 60),
          ),
          // ElevatedButton(onPressed: () {}, child: const Text('Crear'))
        ],
      )

 */
