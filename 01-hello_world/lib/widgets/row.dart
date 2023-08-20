import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {
  const RowWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(color: Colors.black),
      child: Container(
        alignment: Alignment.centerLeft,
        color: Colors.white,
        child: const Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisSize: MainAxisSize.min,
          children: [
            // Expanded(
            //   flex: 2,
            //   child: Container(
            //     width: 50,
            //     height: 50,
            //     color: Colors.red,
            //   ),
            // ),
            // Expanded(
            //   flex: 3,
            //   child: Container(
            //     width: 50,
            //     height: 50,
            //     color: Colors.yellow,
            //   ),
            // ),
            // Flexible(
            //   fit: FlexFit.tight,
            //   // flex: 2,
            //   child: Container(
            //     width: 50,
            //     height: 50,
            //     color: Colors.blue,
            //   ),
            // ),
            // const Flexible(
            //   child: Text(
            //       'Hi sldasñkl dañlks dañks dñkas dksa dlkah sdlja sdljkasdkja sdlj as dknaskld n'),
            // ),
            // Flexible(
            //   // flex: 3,
            //   child: Container(
            //     width: 170,
            //     height: 50,
            //     color: Colors.red,
            //   ),
            // ),
            // Flexible(
            //   flex: 3,
            //   child: Container(
            //     width: 320,
            //     height: 50,
            //     color: Colors.yellow,
            //   ),
            // ),

            // Flexible(
            //   child: FlutterLogo(size: 100),
            // ),
            // Flexible(
            //   flex: 2,
            //   child: FlutterLogo(size: 200),
            // ),
            // Flexible(
            //   child: FlutterLogo(size: 250),
            // ),

            FlutterLogo(size: 100),
            FlutterLogo(size: 100),
            Spacer(),
            FlutterLogo(size: 100),
          ],
        ),
      ),
    );
  }
}
