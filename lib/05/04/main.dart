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
                  print("LimitedBox 自身受到约束(FC): ${constraints}");
                  print("LimitedBox{maxWidth: $maxWidth, maxHeight:$maxHeight}");
                  return _buildTestContent();
                },
              ),
            ),
          ),
        ));
  }

  Widget _buildTestContent() {
    return LimitedBox(
      maxWidth: maxWidth,
      maxHeight: maxHeight,
      child: LayoutBuilder(
        builder: (_, constraints) {
          print("LimitedBox 传递的真实约束(PC): ${constraints}");
          return ColoredBox(
            color: Colors.blue,
          );
        },
      ),
    );
  }
}

