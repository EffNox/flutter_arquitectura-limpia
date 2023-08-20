import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../router/routes.dart';

class ColorsScaffoldWidget extends StatefulWidget {
  const ColorsScaffoldWidget({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  State<ColorsScaffoldWidget> createState() => _ColorsScaffoldWidgetState();
}

class _ColorsScaffoldWidgetState extends State<ColorsScaffoldWidget> {
  @override
  Widget build(BuildContext context) {
    final location = GoRouter.of(context).routerDelegate.currentConfiguration.uri.toString();
    // final selectedIndex = switch (location) { '/red' => 0, '/green' => 1, '/blue' => 2, _ => 0 };
    final selectedIndex = () {
      if (location.contains('/red')) return 0;
      if (location.contains('/green')) return 1;
      if (location.contains('/blue')) return 2;
    }()!;

    return Scaffold(
      body: widget.child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (idx) {
          if (idx == selectedIndex && context.canPop()) return context.pop();

          final route = switch (idx) { 1 => Routes.green, 2 => Routes.blue, _ => Routes.red };

          context.goNamed(route);
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.reddit, color: Colors.redAccent), label: 'Red'),
          NavigationDestination(icon: Icon(Icons.reddit, color: Colors.greenAccent), label: 'Green'),
          NavigationDestination(icon: Icon(Icons.reddit, color: Colors.blueAccent), label: 'Blue'),
        ],
      ),
    );
  }
}
