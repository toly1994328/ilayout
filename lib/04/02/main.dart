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
        body: Center(child: MainAxisAlignmentFlex()),
      ),
    );
  }
}

class MainAxisAlignmentFlex extends StatelessWidget {
  static const TextStyle textStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.bold);

  final blueBox = Container(
    alignment: Alignment.center,
    color: Colors.blue,
    height: 20,
    width: 30,
    child: const Text(
      '1',
      style: textStyle,
    ),
  );

  final redBox = Container(
    alignment: Alignment.center,
    color: Colors.red,
    height: 30,
    width: 40,
    child: const Text(
      '2',
      style: textStyle,
    ),
  );


  final yellowBox = Container(
    alignment: Alignment.center,
    color: Colors.orange,
    height: 50,
    width: 30,
    child: const Text(
      '3',
      style: textStyle,
    ),
  );

  final greenBox = Container(
    alignment: Alignment.center,
    color: Colors.green,
    height: 20,
    width: 20,
    child: const Text(
      '4',
      style: textStyle,
    ),
  );


  @override
  Widget build(BuildContext context) {
    return Wrap(
        runSpacing: 5,
        children: MainAxisAlignment.values
            .map((mode) => Column(children: [
                  Container(
                      margin: const EdgeInsets.all(5),
                      width: 260,
                      height: 80,
                      color: Colors.grey.withAlpha(33),
                      child: _buildItem(mode)),
                  Text(mode.toString().split('.')[1])
                ]))
            .toList());
  }

  Widget _buildItem(MainAxisAlignment mode) => Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: mode,
        children: [blueBox, redBox,yellowBox, greenBox],
      );
}
