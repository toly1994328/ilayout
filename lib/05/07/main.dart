import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final double maxWidth = 100;
  final double maxHeight = 280;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: Center(
            child: Container(
              margin: const EdgeInsets.all(5),
              width: 250,
              height: 150,
              color: Colors.grey.withAlpha(33),
              child: LayoutBuilder(
                builder: (_, constraints) {
                  print("Align 自身受到约束(FC): ${constraints}");
                  return _buildTestContent();
                },
              ),
            ),
          ),
        ));
  }

  Widget _buildTestContent() {
    return Align(
      alignment: Alignment.center,
      child: LayoutBuilder(
        builder: (_, constraints) {
          print("Align 传递的真实约束(PC): ${constraints}");
          return SizedBox(
            width: 50,
            height: 50,
            child: ColoredBox(
              color: Colors.blue,
            ),
          );
        },
      ),
    );
  }
}

