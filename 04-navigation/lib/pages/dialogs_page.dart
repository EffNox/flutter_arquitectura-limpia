import 'package:flutter/material.dart';
import 'package:navigation/dialogs/bottoms_sheet_dialog.dart';
import 'package:navigation/dialogs/confirm_dialog.dart';
import 'package:navigation/dialogs/cupertino_dialog.dart';
import 'package:navigation/dialogs/custom_dialog.dart';

class DialogsPage extends StatelessWidget {
  const DialogsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Show info dialog'),
            onTap: () async {
              await showDialog(
                context: context,
                builder: (context) => const DialogContenWidget(),
              );
              debugPrint('🤝');
            },
          ),
          ListTile(
            title: const Text('Show confirm dialog'),
            onTap: () async {
              final isOk = await showConfirmDialog(
                context,
                title: 'Eliminar?',
                dismissble: false,
              );
              debugPrint('isOk: $isOk');
            },
          ),
          ListTile(
            title: const Text('Show cupertino dialog'),
            onTap: () async {
              final rs = await showDialogWithCupertinoStyle(context,
                  title: 'Hola', content: 'How are you?');
              debugPrint('rs: $rs');
            },
          ),
          ListTile(
            title: const Text('Show bottom sheet dialog'),
            onTap: () async {
              showBottomSheetDialog(context);
            },
          ),
          ListTile(
            title: const Text('Show custom dialog'),
            onTap: () async {
              showCumtomDialog(context);
            },
          ),
        ],
      ),
    );
  }
}

class DialogContenWidget extends StatelessWidget {
  const DialogContenWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: const Text('My Dialog'),
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cerrar '),
        )
      ],
    );
  }
}
