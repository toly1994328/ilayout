import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

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
                  print("FractionallySizedBox 自身受到约束(FC): ${constraints}");
                  print("FractionallySizedBox(widthFactor:0.5,heightFactor: 0.5)");
                  return _buildTestContent();
                },
              ),
            ),
          ),
        ));
  }

  Widget _buildTestContent() {
    return FractionallySizedBox(
      widthFactor: 1.5,
      heightFactor: 0.5,
      child: LayoutBuilder(
        builder: (_, constraints) {
          print("FractionallySizedBox 传递的真实约束(PC): ${constraints}");
          return ColoredBox(
            color: Colors.blue.withOpacity(0.5),
          );
        },
      ),
    );
  }
}

