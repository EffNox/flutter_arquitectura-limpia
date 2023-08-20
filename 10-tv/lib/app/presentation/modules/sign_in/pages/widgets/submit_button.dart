import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../../domain/enums.dart';
import '../../../../../domain/failures/sign_in_failure.dart';
import '../../../../../generated/translations.g.dart';
import '../../../../global/extensions/build_context_ext.dart';
import '../../../../routes/routes.dart';
import '../../controller/sign_in_controller.dart';

class SubmitButtonWidget extends StatelessWidget {
  const SubmitButtonWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final SignInController controller = context.watch();

    if (controller.state.fetching) return const CircularProgressIndicator();

    return ElevatedButton(onPressed: () => _submit(context), child: Text(t.signin.signin));
  }

  Future<void> _submit(BuildContext context) async {
    final isValid = Form.of(context).validate();
    if (isValid) {
      final SignInController controller = context.read();
      final rs = await controller.submit();

      // Comprueba que el contexto este con una vista renderizada
      if (!controller.mounted) return;

      rs.when(
          left: (fail) {
            final msg = switch (fail) {
              NotFound() => t.signin.errors.submit.notFound,
              Unauthorized() => t.signin.errors.submit.unauthorized,
              Network() => t.signin.errors.submit.network,
              Unknown() => t.signin.errors.submit.unknown,
              NotVerified() => t.signin.errors.submit.notVerified,
            };
            context.snackBar(msg: msg, type: SnackBarTypes.error);
          },
          right: (_) => context.goNamed(Routes.home));
    }
  }
}
