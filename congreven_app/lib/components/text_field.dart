import 'package:flutter/material.dart';

renderTextField(
    {String labelText,
    onChanged,
    String Function() errorText,
    bool isSecret = false,
    controller,
    enabled = true,
    TextInputType keyboardType = TextInputType.text}) {
  return TextField(
    obscureText: isSecret,
    onChanged: onChanged,
    controller: controller ?? null,
    enabled: enabled,
    keyboardType: keyboardType,
    decoration: InputDecoration(
      labelText: labelText,
      errorText: errorText == null ? null : errorText(),
    ),
  );
}
