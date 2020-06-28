import 'package:flutter/material.dart';

renderTextField({
  String labelText,
  onChanged,
  String Function() errorText,
  bool isSecret = false,
  controller,
  enabled = true,
}) {
  return TextField(
    obscureText: isSecret,
    onChanged: onChanged,
    controller: controller ?? null,
    enabled: enabled,
    decoration: InputDecoration(
      labelText: labelText,
      errorText: errorText == null ? null : errorText(),
    ),
  );
}
