import 'package:build_context/mixins/mounted_mixin.dart';
import 'package:build_context/pages/home_page.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget with MountedMixin {
  ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final screenSize = context.screenSize;

    return Scaffold(
      // appBar: AppBar(),
      // key: widgetKey,
      body: SafeArea(
        key: widgetKey,
        child: const Center(child: Text('hI')),
      ),
      // body: Column(
      //   children: [
      //     Container(
      //       color: Colors.grey,
      //       height: screenSize.height * .6,
      //       child: Center(child: Text('test@'.isEmail.toString())),
      //     )
      //   ],
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showMessage(context),
      ),
    );
  }

  void _showMessage(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 1));
    if (mounted) {
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => const HomePage()));
    }
    // showDialog(
    //   context: context,
    //   builder: (context) {
    //     final dialoKey = GlobalKey();
    //     return AlertDialog(
    //       key: dialoKey,
    //       content: const Text('Hello'),
    //       actions: [
    //         TextButton(
    //           onPressed: () async {
    //             await Navigator.pushReplacement(
    //                 context,
    //                 MaterialPageRoute(
    //                   builder: (_) => const HomePage(),
    //                 ));

    //             if (dialoKey.currentWidget != null) {
    //               context.size;
    //             }
    //           },
    //           child: const Text('Go to home'),
    //         ),
    //       ],
    //     );
    //   },
    // );
  }
}
