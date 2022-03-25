import 'package:flutter/material.dart';

void main() {
  runApp(
    const Padding(
      padding: EdgeInsets.only(
        left: 10,
        top: 20,
        right: 30,
        bottom: 40,
      ),
      child: ColoredBox(color: Colors.blue),
    ),
  );
}
