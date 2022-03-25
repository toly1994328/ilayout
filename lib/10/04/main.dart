import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home : Wrap(
        children: const [
          SizedBox(
            width: 60, height: 60, child: ColoredBox(color: Colors.blue),
          ),
          SizedBox(
            width: 140, height: 40, child: ColoredBox(color: Colors.red),
          ),
          SizedBox(
            width: 100, height: 40, child: ColoredBox(color: Colors.yellow),
          ),
          SizedBox(
            width: 40, height:60, child: ColoredBox(color: Colors.green),
          )
        ],
      ),
    ),
  );
}
