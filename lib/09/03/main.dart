import 'package:flutter/material.dart';

void main() {

  runApp(
     const OverflowBox(
       minWidth: 50,
      minHeight: 60,
      alignment: Alignment.centerLeft,
      child: SizedBox(
          width: 80,
          height: 40,
          child: ColoredBox(color: Colors.blue)),
    ),
  );
}
