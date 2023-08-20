import 'package:flutter/material.dart';

Future<T> showLoader<T>(BuildContext context, Future<T> future) async {
  final overlayState = Overlay.of(context);

  final entry = OverlayEntry(
    builder: (context) => Container(
      color: Colors.black45,
      child: const Center(child: CircularProgressIndicator(color: Colors.white, strokeWidth: 15, strokeAlign: 15)),
    ),
  );

  overlayState.insert(entry);

  final rs = await future;

  entry.remove();

  return rs;
}
