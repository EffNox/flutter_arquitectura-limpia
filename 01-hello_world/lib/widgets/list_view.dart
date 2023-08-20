import 'package:flutter/material.dart';
import 'package:hello_world/widgets/list_view_builder.dart';

class ListViewPage extends StatelessWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        // top: false,
        child: ListView(
          children: [
            IconButton(
              onPressed: () {
                final route = MaterialPageRoute(
                    builder: (_) => const ListViewBuilderPage());
                Navigator.push(context, route);
              },
              icon: const Icon(Icons.login_outlined),
            ),
            SizedBox(
              height: 150,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  18,
                  (index) => Container(
                    width: 100,
                    color: Colors.primaries[index],
                    alignment: Alignment.center,
                    child: Text('$index'),
                  ),
                ),
              ),
            ),
            ListView(
              shrinkWrap: true,
              // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag, //desaparecer teclado cuando deslice
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(
                5,
                (index) => Container(
                  height: 50,
                  margin: const EdgeInsets.all(5),
                  color: Colors.blue,
                ),
              ),
            ),
            Container(
              color: Colors.red,
              height: 150,
            ),
            Container(
              color: Colors.lightGreenAccent,
              height: 450,
            ),
          ],
        ),
      ),
    );
  }
}
