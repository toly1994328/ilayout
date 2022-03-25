import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final double maxWidth = 100;
  final double maxHeight = 280;
  final double minWidth = 50;
  final double minHeight = 25;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: Center(
            child: Container(
              margin: const EdgeInsets.all(5),
              alignment: Alignment.topLeft,
              width: 250,
              height: 150,
              color: Colors.grey.withAlpha(33),
              child: LayoutBuilder(
                builder: (_, constraints) {
                  print("OverflowBox 自身受到约束(FC): ${constraints}");
                  print("OverflowBox(${minWidth}<=w<=${maxWidth}, ${minHeight}<=h<=${maxHeight})");
                  return _buildTestContent();
                },
              ),
            ),
          ),
        ));
  }

  Widget _buildTestContent() {
    return OverflowBox(
      alignment: Alignment.topLeft,
      maxHeight: maxHeight,
      maxWidth: maxWidth,
      minWidth: minWidth,
      minHeight: minHeight,
      child: LayoutBuilder(
        builder: (_, constraints) {
          print("OverflowBox 传递的真实约束(PC): ${constraints}");
          return SizedBox(
            height: 170,
            child: ColoredBox(
              color: Colors.blue,
            ),
          );
        },
      ),
    );
  }
}

