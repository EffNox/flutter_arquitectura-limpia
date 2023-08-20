import 'package:flutter/material.dart';

class SafeAreaWidget extends StatelessWidget {
  const SafeAreaWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey,
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            // const Text('SafeAreaWidget'),
            Expanded(
                child: Container(
              color: Colors.blue,
              width: double.infinity,
              child: const SafeArea(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('test@test.com'),
                      Text('test@test.com'),
                    ]),
              ),
            )),
            Expanded(child: Container(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
