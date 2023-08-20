import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: DefaultTextStyle(
        style: const TextStyle(),
        child: Container(
          // width: 200,
          // height: 200,
          color: Colors.red,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          // decoration: BoxDecoration(
          //     color: Colors.white,
          //     // borderRadius: BorderRadius.all(Radius.circular(50)),
          //     shape: BoxShape.circle,
          //     boxShadow: [
          //       BoxShadow(
          //           color: Colors.blue.withOpacity(.5),
          //           blurRadius: 10,
          //           offset: Offset(-5, -10)
          //           // spreadRadius: 100,
          //           ),
          //       // BoxShadow(
          //       //   color: Colors.red.withOpacity(.5),
          //       //   blurRadius: 10,
          //       // ),
          //     ],
          //     gradient: RadialGradient(
          //       colors: [
          //         Colors.white,
          //         Colors.blue.withOpacity(.2),
          //         Colors.red,
          //       ],
          //       stops: const [
          //         0.6,
          //         0.95,
          //         1,
          //       ],
          //     )),
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          // alignment: Alignment.center,
          child: const Text(
            'Fernando n Paricahua',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
