import 'package:flutter/material.dart';

class ColumnWidget extends StatelessWidget {
  const ColumnWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(color: Colors.black),
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 55),
        child: Center(
          child: Container(
            width: 400,
            color: Colors.grey,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // mainAxisSize: MainAxisSize.min, //tamaño según sus hijos
              children: [
                // const Text('Hello'),
                // const Text(
                //   'World ',
                //   style: TextStyle(
                //     color: Colors.blue,
                //     fontSize: 25,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                // const Spacer(),
                // const SizedBox(height: 20),
                // Expanded(
                //   flex: 3,
                //   child: Container(
                //     // margin: const EdgeInsets.only(top: 20),
                //     color: Colors.pinkAccent,
                //   ),
                // ),
                // Expanded(
                //   flex: 2,
                //   child: Container(
                //     color: Colors.grey,
                //   ),
                // ),
                // Expanded(
                //   flex: 1,
                //   child: Container(
                //     color: Colors.yellow,
                //   ),
                // ),
                // Expanded(
                //   child: Container(
                //     color: Colors.red,
                //   ),
                // ),
                // const SizedBox(height: 20),

//                 Container(
//                   // alignment: Alignment.topLeft,
//                   width: double.infinity,
//                   color: Colors.pinkAccent,
//                   child: const Text('''asdlasnd
// asdlk amslkdmalñskmd a
// as dalm sdñlasd
// as dalm sdñlasd
// as sad
// as dalm sdñlasd
// as sad
// as dalm sdñlasd
// as sad
// as dalm sdñlasd
// as sad
// as sad
// f asd fasdf asdf as
// df '''),
//                 ),
//                 Flexible(
//                   child: Container(
//                     height: 200,
//                     color: Colors.red,
//                   ),
//                 ),
                Container(
                  color: Colors.blue,
                  child: const Flexible(
                    child: FlutterLogo(size: 100),
                  ),
                ),
                const Flexible(child: FlutterLogo(size: 200)),
                Container(
                  height: 100,
                  width: 300,
                  color: Colors.red,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
