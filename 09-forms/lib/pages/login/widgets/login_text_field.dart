import 'package:flutter/material.dart';

class LoginTextField extends FormField<String> {
  LoginTextField({
    Key? key,
    TextInputAction? textInputAction,
    required String label,
    TextInputType? keyboardType,
    bool obscureText = false,
    String? Function(String?)? validator,
    void Function(String)? onSubmitted,
    void Function(String)? onChanged,
  }) : super(
          key: key,
          validator: validator,
          autovalidateMode: AutovalidateMode.always,
          builder: (state) {
            bool isOk = !state.hasError &&
                state.value != null &&
                state.value!.isNotEmpty;
            return TextField(
              textInputAction: textInputAction,
              keyboardType: keyboardType,
              obscureText: obscureText,
              onSubmitted: onSubmitted,
              onChanged: (text) {
                state.didChange(text);
                if (onChanged != null) onChanged(text);
              },
              decoration: InputDecoration(
                label: Text(label),
                suffixIcon: Icon(
                  Icons.check_circle,
                  color: isOk ? Colors.green : Colors.black12,
                ),
              ),
            );
          },
        );
}
