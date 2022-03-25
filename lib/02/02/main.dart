import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp(),);
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Timer(Duration(seconds: 3),(){
    //   debugDumpRenderTree();
    // });
    return const MaterialApp(
      home: ColoredBox(color: Colors.blue),
    );
  }
}

