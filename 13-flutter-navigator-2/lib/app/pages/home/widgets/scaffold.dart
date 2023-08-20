import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../router/routes.dart';

class HomeScaffoldWidget extends StatefulWidget {
  const HomeScaffoldWidget({super.key, required this.child});
  final Widget child;

  @override
  State<HomeScaffoldWidget> createState() => _HomeScaffoldWidgetState();
}

class _HomeScaffoldWidgetState extends State<HomeScaffoldWidget> {
  final counter = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => counter.value++);
  }

  @override
  void didUpdateWidget(covariant HomeScaffoldWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    WidgetsBinding.instance.addPostFrameCallback((_) => counter.value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: ValueListenableBuilder<int>(
            valueListenable: counter,
            builder: (_, value, __) {
              return AppBar(
                // leading: Navigator.canPop(context) ? const BackButton() : null,
                leading: value > 0 && context.canPop() ? BackButton(onPressed: () => context.pop()) : null,
                actions: [
                  IconButton(onPressed: () => context.pushNamed(Routes.profile), icon: const Icon(Icons.person)),
                  // IconButton(onPressed: () => context.goNamed(Routes.profile), icon: const Icon(Icons.person)),
                ],
              );
            },
          )),
      body: widget.child,
    );
  }
}
