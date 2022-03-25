import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      // textDirection: TextDirection.ltr,
      home: Stack(
         children: const [
           SizedBox(
             width: 60, height: 60, child: ColoredBox(color: Colors.blue),
           ),
           SizedBox(
             width: 40, height: 40, child: ColoredBox(color: Colors.red),
           )
         ],
       ),
     ),
  );
}
