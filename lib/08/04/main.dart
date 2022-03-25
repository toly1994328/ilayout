import 'package:flutter/material.dart';

void main() {
  runApp(Align(
    alignment: Alignment.topLeft,
    child: const AspectRatio(
      aspectRatio: 0.5,
      child: ColoredBox(color: Colors.blue),
    ),
  ));
}
