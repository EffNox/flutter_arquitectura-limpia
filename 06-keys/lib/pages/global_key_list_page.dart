import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final gKeyList = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: OrientationBuilder(
        builder: (context, orientation) {
          final listView = ListView.builder(
            key: gKeyList,
            itemCount: 1000,
            itemBuilder: (_, i) {
              return ListTile(
                title: Text('$i'),
              );
            },
          );

          if (orientation == Orientation.portrait) {
            return Column(
              children: [
                const Text('PORTRAIT'),
                Expanded(
                  child: listView,
                ),
              ],
            );
          }
          return Row(
            children: [
              const Expanded(child: Text('LANDSCAPE')),
              Expanded(
                child: listView,
              )
            ],
          );
        },
      ),
    );
  }
}
