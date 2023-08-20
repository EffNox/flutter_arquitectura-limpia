import 'package:flutter/material.dart';
import 'package:forms/pages/login/login_mixin.dart';
import 'package:forms/pages/login/widgets/login_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with LoginMixin {
  String _email = '', _password = '';
  // bool _checked = false;

  @override
  Widget build(BuildContext context) {
    // bool allowSubmit =
    //     emailValidator(_email) == null && pwdValidator(_password) == null;

    return Form(
      child: Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(15),
            children: [
              // Correo inválido
              // TextFormField(
              //   autovalidateMode: AutovalidateMode.onUserInteraction,
              //   // initialValue: 'correo@gotmail.com',
              //   onChanged: (value) => setState(() => _email = value),
              //   keyboardType: TextInputType.emailAddress,
              //   decoration: const InputDecoration(label: Text('Correo')),
              //   validator: emailValidator,
              // ),
              LoginTextField(
                label: 'Correo',
                textInputAction: TextInputAction.next,
                onChanged: (value) => setState(() => _email = value),
                keyboardType: TextInputType.emailAddress,
                validator: emailValidator,
              ),
              const SizedBox(height: 30),
              // TextFormField(
              //   autovalidateMode: AutovalidateMode.onUserInteraction,
              //   onChanged: (value) => setState(() => _password = value.trim()),
              //   obscureText: true,
              //   decoration: const InputDecoration(label: Text('Contraseña')),
              //   validator: pwdValidator,
              // ),
              Builder(builder: (context) {
                return LoginTextField(
                  label: 'Contraseña',
                  textInputAction: TextInputAction.send,
                  obscureText: true,
                  onChanged: (value) =>
                      setState(() => _password = value.trim()),
                  onSubmitted: (_) => _submit(context),
                  validator: pwdValidator,
                );
              }),
              // const SizedBox(height: 30),
              // LoginCheckBox(
              //   initialValue: _checked,
              //   onChanged: (value) => setState(() => _checked = value),
              //   validator: checkBoxValidator,
              // ),
              const SizedBox(height: 30),
              Builder(builder: (context) {
                return ElevatedButton(
                  // onPressed: allowSubmit ? _submit : null,
                  onPressed: () => _submit(context),
                  child: const Text('Iniciar sesión'),
                );
                // return MaterialButton(
                //   // onPressed: allowSubmit ? _submit : null,
                //   onPressed: () => _submit(context),
                //   color: Colors.blue.withOpacity(allowSubmit ? 1 : 0.2),
                //   child: const Text('Iniciar sesión'),
                // );
              })
            ],
          ),
        ),
      ),
    );
  }

  _submit(BuildContext context) {
    final formState = Form.of(context);
    if (formState.validate()) {
      debugPrint('Todo correcto 🤙');
    }
  }
}
