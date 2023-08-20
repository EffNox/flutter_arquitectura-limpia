import 'package:flutter/cupertino.dart';

class CupertinoScaffoldPage extends StatelessWidget {
  const CupertinoScaffoldPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      child: Center(
        child: Text('data'),
      ),
    );
  }
}
