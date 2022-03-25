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
            child: Demo(),
          ),
        ));
  }

}

class Demo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 80,
        runSpacing: 80,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: BoxFit.values
            .toList()
            .map((mode) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          Container(
              width: 140,
              height: 50,
              color: Colors.grey.withAlpha(88),
              child: FittedBox(
                fit: mode,
                  child: Container(
                    width: 30,
                    height: 30,
                    color: Colors.cyanAccent,
                    child: Text(mode.toString().split('.')[0]),
                  ),
              )),
          Text('$mode')
        ]))
            .toList());
  }
}

