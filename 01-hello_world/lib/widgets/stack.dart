import 'package:flutter/material.dart';

class StackWidget extends StatelessWidget {
  const StackWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(color: Colors.black),
      child: Container(
        color: Colors.white,
        child: Center(
          child: Container(
            color: Colors.grey,
            // width: 400,
            // height: 500,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  // width: 150,
                  height: 100,
                  color: Colors.green,
                  child: const Text('GREEN'),
                ),
                Container(
                  width: 300,
                  height: 50,
                  color: Colors.blue,
                ),
                const Positioned(
                  bottom: -30,
                  right: -50,
                  child: FlutterLogo(size: 100),
                ),
                const Positioned(
                  bottom: 0,
                  child: Text('Hi'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
