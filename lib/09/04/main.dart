import 'package:flutter/material.dart';

void main() {
  runApp(
    const Directionality(
      textDirection: TextDirection.ltr,
      child:  SizedOverflowBox(
        size: Size(80, 90),
        alignment: Alignment.center,
        child: SizedBox(
            width: 40, height: 40, child: ColoredBox(color: Colors.blue)),
      ),
    ),
  );
}
