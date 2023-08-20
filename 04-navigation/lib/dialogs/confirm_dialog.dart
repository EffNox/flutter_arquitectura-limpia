import 'package:flutter/material.dart';

Future<bool> showConfirmDialog(BuildContext context,
    {String title = '', dismissble = true}) async {
  final rs = await showDialog<bool>(
    context: context,
    barrierColor: Colors.white.withOpacity(.05),
    // barrierDismissible: false, // De isas el Widget WillPopScope no es necesario este parámetro
    builder: (context) => WillPopScope(
      onWillPop: () async => dismissble,
      child: _DialogContentWidget(title: title),
    ),
  );

  return rs ?? false;
}

class _DialogContentWidget extends StatelessWidget {
  final String title;
  const _DialogContentWidget({required this.title});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title, textAlign: TextAlign.center),
      // alignment: Alignment.topCenter,
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        ElevatedButton(
          onPressed: () => Navigator.pop(context, true),
          child: const Text(
            'Yes',
            style: TextStyle(color: Colors.greenAccent),
          ),
        ),
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.redAccent),
          ),
        ),
      ],
    );
  }
}
