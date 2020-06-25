import 'package:flutter/material.dart';

renderTextField(
    {String labelText,
    onChanged,
    String Function() errorText,
    bool isSecret = false,
    controller}) {
  return TextField(
    obscureText: isSecret,
    onChanged: onChanged,
    controller: controller ?? null,
    decoration: InputDecoration(
      labelText: labelText,
      errorText: errorText == null ? null : errorText(),
    ),
  );
}
