import 'package:flutter/material.dart';

import '../../../generated/assets.gen.dart';
import '../../../generated/translations.g.dart';

class RequestFailedWidget extends StatelessWidget {
  final VoidCallback onRetry;
  final String? msg;

  const RequestFailedWidget({Key? key, required this.onRetry, this.msg}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.black12,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image.asset(Assets.images.error404.path),
          // Expanded(child: Assets.images.error404.image()),
          Expanded(child: Assets.svgs.error404.svg()),
          // Assets.svgs.error404.sv

          Text(msg ?? t.misc.requestFailed),
          ElevatedButton(onPressed: onRetry, child: Text(t.misc.retry)),
          const SizedBox(height: 20)
        ],
      ),
    );
  }
}
