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
                  print("Padding 自身受到约束(FC): ${constraints}");
                  print("Padding: left: 10,top: 20,right: 30,bottom: 40");
                  return _buildTestContent();
                },
              ),
            ),
          ),
        ));
  }

  Widget _buildTestContent() {
    return Padding(
      padding: const EdgeInsets.only(left: 10,top: 20,right: 30,bottom: 40),
      child: LayoutBuilder(
        builder: (_, constraints) {
          print("Padding 传递的真实约束(PC): ${constraints}");
          return SizedBox(
            width: 30,
            height: 30,
            // height: 10000,
            child: ColoredBox(
                color: Colors.blue,
            ),
          );
        },
      ),
    );
  }
}

