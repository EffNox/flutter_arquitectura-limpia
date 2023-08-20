import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String usr = '', pwd = '';

  bool get isValidForm => (usr.contains('@') && pwd.trim().length >= 5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Correo:'),
              TextField(onChanged: (value) {
                usr = value;
                setState(() {});
              }),
              const SizedBox(height: 30),
              const Text('Contraseña:'),
              TextField(
                onChanged: (value) {
                  pwd = value;
                  setState(() {});
                },
                obscureText: true,
              ),
              const SizedBox(height: 50),
              Center(
                child: ElevatedButton(
                  onPressed: isValidForm ? () {} : null,
                  child: const Text('Iniciar sesión'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
