import 'package:flutter/material.dart';

void main() {
  runApp(const LimitedBox(
    maxWidth: 100,
    maxHeight: 50,
    child: ColoredBox(color: Colors.blue),
  ));
}
