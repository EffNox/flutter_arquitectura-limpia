import 'package:flutter/cupertino.dart';

Future<int> showDialogWithCupertinoStyle(BuildContext context,
    {String title = '', String content = ''}) async {
  final rs = await showCupertinoDialog<int>(
    barrierDismissible: true,
    context: context,
    builder: (context) => CupertinoAlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        CupertinoDialogAction(
          onPressed: () {
            Navigator.pop(context, 1);
          },
          child: const Text('Ok'),
        ),
        CupertinoDialogAction(
          onPressed: () {
            Navigator.pop(context, 2);
          },
          child: const Text('No'),
        ),
        CupertinoDialogAction(
          onPressed: () {
            Navigator.pop(context, 3);
          },
          child: const Text('SADNo'),
        ),
      ],
    ),
  );
  return rs ?? 1;
}
