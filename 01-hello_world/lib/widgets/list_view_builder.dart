import 'package:flutter/material.dart';

class ListViewBuilderPage extends StatelessWidget {
  const ListViewBuilderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final names = ['Darwin', 'Lulu', 'Pepe'];

    return Scaffold(
      appBar: AppBar(),
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (_, i) => Row(
          children: [
            Expanded(child: Container(height: 2, color: Colors.black38)),
            Padding(
              padding: const EdgeInsets.all(4),
              child: Text('${names[i].length}'),
            ),
            Expanded(child: Container(height: 2, color: Colors.black38)),
          ],
        ),
        itemCount: names.length,
        itemBuilder: (_, i) {
          final name = names[i];
          debugPrint('🧐');
          return Container(
            height: 100,
            color: Colors.green,
            // margin: const EdgeInsets.all(5),
            alignment: Alignment.center,
            child: Text(name),
          );
        },
      ),
    );
  }
}
