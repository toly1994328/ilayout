import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Center(child: VerticalDirectionFlex()),
      ),
    );
  }
}

class VerticalDirectionFlex extends StatelessWidget {
  final redBox = const Text(
    "张风捷特烈",
    style: TextStyle(fontSize: 20, backgroundColor: Colors.red),
  );

  final blueBox = const Text(
    "toly",
    style: TextStyle(fontSize: 50, backgroundColor: Colors.blue),
  );

  final yellowBox = const Text(
    "1994",
    style: TextStyle(fontSize: 30, backgroundColor: Colors.green),
  );

  @override
  Widget build(BuildContext context) {
    return Wrap(
        runSpacing: 5,
        children: TextBaseline.values
            .map((mode) => Column(children: [
                  Container(
                      margin: const EdgeInsets.all(5),
                      width: 360,
                      height: 80,
                      color: Colors.grey.withAlpha(33),
                      child: _buildItem(mode)),
                  Text(mode.toString().split('.')[1])
                ]))
            .toList());
  }

  Widget _buildItem(TextBaseline mode) => Flex(
        direction: Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: mode,
        children: [
          blueBox,
          redBox,
          yellowBox,
        ],
      );
}
