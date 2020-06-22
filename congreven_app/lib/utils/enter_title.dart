import 'package:flutter/material.dart';

renderEnterTitle({
  String firstLine = 'Título 1',
  String secondLine = 'Título 2',
  double firstLineSize = 12.0,
  double secondLineSize = 12.0,
}) {
  return RichText(
    text: TextSpan(
      style: TextStyle(
        color: Colors.black,
      ),
      children: <TextSpan>[
        TextSpan(
          text: firstLine,
          style: TextStyle(
            fontSize: firstLineSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextSpan(
          text: secondLine,
          style: TextStyle(
            fontSize: secondLineSize,
          ),
        ),
      ],
    ),
  );
}
