import 'package:flutter/material.dart';

void main() {
  runApp(const FittedBox(
    fit: BoxFit.fill,
    child: SizedBox(
      width: 80,
      height: 60,
      child: DecoratedBox(decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color(0xFFF60C0C), Color(0xFFF3B913),
                Color(0xFFE7F716), Color(0xFF3DF30B),
                Color(0xFF0DF6EF), Color(0xFF0829FB),
                Color(0xFFB709F4),
              ]
          )
      ),
  ),
    )));
}
