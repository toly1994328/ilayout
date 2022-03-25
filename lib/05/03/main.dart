import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

   final double width = 100;
   final double height = 280;

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
              alignment: Alignment.topLeft,
              width: 250,
              height: 150,
              color: Colors.grey.withAlpha(33),
              child: LayoutBuilder(
                builder: (_, constraints) {
                  print("SizedBox 自身受到约束(FC): ${constraints}");
                  print("SizedBox{width: $width, height:$height}");
                  return _buildTestContent();
                },
              ),
            ),
          ),
        ));
  }

  Widget _buildTestContent() {
    return SizedBox(
      width: width,
      height: height,
      child: LayoutBuilder(
        builder: (_, constraints) {
          print("SizedBox 传递的真实约束(PC): ${constraints}");
          return ColoredBox(
            color: Colors.blue,
          );
        },
      ),
    );
  }
}
