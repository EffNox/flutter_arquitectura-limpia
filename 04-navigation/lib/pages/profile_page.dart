import 'package:flutter/material.dart';
import 'package:navigation/routes.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const SizedBox.shrink()),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigator.popUntil(context, (route) {
            //   debugPrint(
            //       '${route.settings.name == Routes.initialRoute ? '✅' : '❌'}  ${route.settings.name}');
            //   return (route.settings.name == Routes.initialRoute);
            // });
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.initialRoute,
              (route) => false,
            );
          },
          child: const Text('Cerrar sesión'),
        ),
      ),
    );
  }
}
