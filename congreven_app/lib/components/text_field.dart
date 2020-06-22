import 'package:flutter/material.dart';

renderTextField({
  String labelText,
  onChanged,
  String Function() errorText,
  bool isSecret = false,
}) {
  return TextField(
    obscureText: isSecret,
    onChanged: onChanged,
    decoration: InputDecoration(
      labelText: labelText,
      errorText: errorText == null ? null : errorText(),
    ),
  );
}
