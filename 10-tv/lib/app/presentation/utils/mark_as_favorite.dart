import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/failures/http_request/http_request_failure.dart';
import '../../domain/models/media.dart';
import '../global/controllers/favorites/favorites_controller.dart';
import '../global/dialogs/show_loader.dart';
import '../global/extensions/build_context_ext.dart';

Future<void> markAsFavorite({
  required BuildContext context,
  required Media media,
  required bool Function() mounted,
}) async {
  final FavoritesController favoritesController = context.read();

  final rs = await showLoader(context, favoritesController.markAsFavorite(media));

  if (!mounted()) return;

  rs.whenOrNull(left: (failure) async {
    final msg = switch (failure) {
      HttpRequestFailureNotFound() => 'Recurso no encontrado',
      HttpRequestFailureNetwork() => 'Error de Internet',
      HttpRequestFailureUnauthorized() => 'No autorizado',
      HttpRequestFailureUnknown() => 'Error desconocido'
    };
    context.snackBar(msg: msg);
  });
}
