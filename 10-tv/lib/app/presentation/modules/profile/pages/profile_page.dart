import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../global/controllers/session_controller.dart';
import '../../../global/controllers/theme_controller.dart';
import '../../../global/extensions/build_context_ext.dart';
import '../../../routes/routes.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SwitchListTile(
            title: const Text('Modo oscuro'),
            value: context.darkMode,
            onChanged: context.read<ThemeController>().onChange,
          ),
          ListTile(
            onTap: () {
              context.read<SessionController>().signOut();
              context.goNamed(Routes.signIn);
            },
            title: const Text('Sign Out'),
          ),
        ],
      ),
    );
  }
}
