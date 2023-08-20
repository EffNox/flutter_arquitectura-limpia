import 'package:flutter/material.dart';
import 'package:forms/pages/login/login_page.dart';

mixin LoginMixin on State<LoginPage> {
  String? emailValidator(String? text) {
    text ??= ''; // text = text ??'';
    final isValid = RegExp(
            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
        .hasMatch(text);

    return isValid ? null : 'Correo inválido';
  }

  String? pwdValidator(String? value) {
    value ??= ''; // value = value ??'';
    value = value.replaceAll(' ', '');
    return (value.length >= 8) ? null : 'Contraseña inválida';
  }

  String? checkBoxValidator(bool? value) {
    return (value == true) ? null : 'Terminos y condiciones obligatorios';
  }
}
