import 'package:flutter/material.dart';
import 'package:navigation/pages/profile_page.dart';

class LoginPage extends StatelessWidget {
  final String email;
  const LoginPage({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final email = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.maybePop(context);
        //   },
        //   icon: const Icon(Icons.arrow_back_ios_new_outlined),
        // ),
        title: const Text('LoginPage'),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // child: Text('LoginPage $email'),
            ElevatedButton(
              onPressed: () {
                final route = MaterialPageRoute(
                  builder: (_) => const ProfilePage(),
                  // settings: const RouteSettings(name: '/profile'),
                );
                Navigator.push(context, route);
              },
              child: Text('LoginPage $email'),
            ),
            Expanded(
                child: ListView.builder(
              itemCount: Colors.primaries.length,
              itemBuilder: (context, index) {
                final color = Colors.primaries[index];
                return Container(
                  height: 70,
                  color: color,
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
