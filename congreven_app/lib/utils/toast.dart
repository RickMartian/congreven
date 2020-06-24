import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';

toast(
    {String title = "Título",
    String message = "mensagem",
    Icon icon,
    Duration duration = const Duration(milliseconds: 1500),
    BuildContext context}) {
  Flushbar(
    title: title,
    message: message,
    icon: icon == null ? null : icon,
    duration: duration,
  )..show(context);
}
