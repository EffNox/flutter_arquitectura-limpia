import 'package:flutter/material.dart';

class LoginCheckBox extends FormField<bool> {
  // LoginCheckBox({required super.builder});

  LoginCheckBox({
    Key? key,
    bool? initialValue,
    String? Function(bool?)? validator,
    required void Function(bool value) onChanged,
  }) : super(
          key: key,
          validator: validator,
          initialValue: initialValue,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          builder: (state) {
            return Column(
              children: [
                CheckboxListTile(
                  title: const Text('Aceptar terminos y condiciones'),
                  value: state.value ?? false,
                  controlAffinity: ListTileControlAffinity.leading,
                  onChanged: (v) {
                    state.didChange(v);
                    if (v != null) onChanged(v);
                  },
                ),
                if (state.hasError)
                  Text(
                    state.errorText!,
                    style: const TextStyle(color: Colors.redAccent),
                  ),
              ],
            );
          },
        );
}
