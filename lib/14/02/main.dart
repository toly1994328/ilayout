import 'package:flutter/material.dart';

void main() {
  runApp(Directionality(
    textDirection: TextDirection.ltr,
    child: Align(
      alignment: Alignment.topRight,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 120,
              color: Colors.red,
            ),
            Container(
              width: 40,
              height: 80,
              color: Colors.blue,
            ),
            Container(
              width: 40,
              color: Colors.green,
            ),
          ],
        ),
      ),
    ),
  ));
}
