import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../global/session_controller.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key, required this.callbackUrl}) : super(key: key);
  final String callbackUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: TextButton(
          onPressed: () {
            context.read<SessionController>().setSignedIn(true);
            context.go(callbackUrl);
          },
          child: const Text('Sign in'),
        ),
      ),
    );
  }
}
