
import 'package:flutter/material.dart';

void main() {
  runApp(LayoutBuilder(
    builder: (context,constraints) {
      return  MyApp(constraints);
    }
  ),);
}

class MyApp extends StatelessWidget {
  final BoxConstraints rootBoxConstraints;
  const MyApp(this.rootBoxConstraints,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: LayoutBuilder(
        builder: (context, constraints) {
          print(identical(constraints,rootBoxConstraints));
          print(constraints==rootBoxConstraints);
          return Container(color: Colors.blue);
        }
      ),
    );
  }
}

