import 'package:flutter/material.dart';

AlertDialog _renderAlertDialog(
  String title,
  String content,
  List<String> options,
  BuildContext context,
  void Function() onPressed,
) {
  return AlertDialog(
    title: Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
    content: Text(
      content,
      style: TextStyle(
        color: Colors.white,
      ),
    ),
    elevation: 10.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
    backgroundColor: Theme.of(context).accentColor.withOpacity(0.9),
    actions: <Widget>[
      FlatButton(
        child: Text(
          options[0],
          style: TextStyle(color: Colors.white),
        ),
        onPressed: onPressed,
      ),
      FlatButton(
        child: Text(
          options[1],
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    ],
  );
}

customDialog({
  BuildContext context,
  String title,
  String message,
  List<String> options = const ["Sim", "Não"],
  void Function() onPressed,
}) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (_) => _renderAlertDialog(
      title,
      message,
      options,
      context,
      onPressed,
    ),
  );
}
