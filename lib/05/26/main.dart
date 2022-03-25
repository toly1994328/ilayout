import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: Center(
            child: Container(
                width: 240,
                height: 100,
                color: Colors.grey.withAlpha(55),
                child: FittedBox(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: 70,
                    height: 70,
                    alignment: Alignment.center,
                    color: Colors.cyanAccent,
                    child: Text(
                      ' BoxFit.contain',
                      // style: style,
                    ),
                  ),
                )),
          ),
        ));
  }
}

