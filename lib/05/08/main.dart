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
            child: Demo(),
          ),
        ));
  }

}

class Demo extends StatelessWidget {
  final alignments = [
    Alignment.topLeft,
    Alignment.topCenter,
    Alignment.topRight,
    Alignment.centerLeft,
    Alignment.center,
    Alignment.centerRight,
    Alignment.bottomLeft,
    Alignment.bottomCenter,
    Alignment.bottomRight,
  ];

  final alignmentsInfo = [
    "topLeft",
    "topCenter",
    "topRight",
    "centerLeft",
    "center",
    "centerRight",
    "bottomLeft",
    "bottomCenter",
    "bottomRight",
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
        children: alignments
            .toList()
            .map((mode) => Column(children: <Widget>[
          Container(
              margin: EdgeInsets.all(5),
              width: 100,
              height: 60,
              color: Colors.grey.withAlpha(88),
              child: Align(
                  child: Container(
                    width: 30,
                    height: 30,
                    color: Colors.cyanAccent,
                  ),
                  alignment: mode)),
          Text(alignmentsInfo[alignments.indexOf(mode)])
        ]))
            .toList());
  }
}

