import 'package:flutter/material.dart';

void main() {
  runApp(
     const Align(
      alignment: Alignment.center,
      child: SizedBox(
          width: 80,
          height: 40,
          child: ColoredBox(color: Colors.blue)),
    ),
  );
}
