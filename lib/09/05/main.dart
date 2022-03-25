import 'package:flutter/material.dart';

void main() {
  runApp(
    const FractionallySizedBox(
      widthFactor: 0.5,
      heightFactor: 0.4,
      alignment: Alignment.center,
      child: SizedBox(
          width: 40, height: 40, child: ColoredBox(color: Colors.blue)),
    ),
  );
}
