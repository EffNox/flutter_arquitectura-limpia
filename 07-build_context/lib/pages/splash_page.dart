import 'package:build_context/mixins/after_first_layout_mixin.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with AfterFirstLayoutMixin {
  // @override
  // void initState() {
  //   super.initState();
  //   // Espera a que cargué por completo los primeros widgets y inicia funciones
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     _init();
  //   });
  //   // _init();
  // }
  @override
  void initState() {
    debugPrint('🤙:');
    super.initState();
    debugPrint('🥶');
  }

  @override
  Future<void> onAfterFirstLayout() async {
    // check session
    // await Future.delayed(const Duration(milliseconds: 100));
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              content: Text('Hello'),
            ));
    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => const HomePage(),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
