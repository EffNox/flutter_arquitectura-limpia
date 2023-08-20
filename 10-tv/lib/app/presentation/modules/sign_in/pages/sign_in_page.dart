import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../generated/translations.g.dart';
import '../controller/sign_in_controller.dart';
import '../controller/sign_in_state.dart';
import 'widgets/submit_button.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignInController>(
      create: (_) => SignInController(
        const SignInState(),
        sessionController: context.read(),
        favoritesController: context.read(),
        authenticationRepository: context.read(),
      ),
      child: Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Builder(builder: (context) {
                final controller = context.watch<SignInController>();
                return AbsorbPointer(
                  absorbing: controller.state.fetching,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        initialValue: controller.state.usr,
                        onChanged: (v) => controller.onUsrChanged(v),
                        decoration: InputDecoration(hintText: t.signin.usr),
                        validator: (value) {
                          value = value?.trim() ?? '';
                          return (value.isEmpty) ? t.signin.errors.usr : null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        initialValue: controller.state.pwd,
                        onChanged: (v) => controller.onPwdChanged(v),
                        decoration: InputDecoration(hintText: t.signin.pwd),
                        obscureText: true,
                        validator: (value) {
                          value = value?.trim() ?? '';
                          return (value.length < 4) ? t.signin.errors.pwd : null;
                        },
                      ),
                      const SizedBox(height: 20),
                      const SubmitButtonWidget()
                    ],
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
