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
        runSpacing: 40,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: BoxFit.values
            .toList()
            .map((mode) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          Container(
              width: 50,
              height: 80,
              color: Colors.grey.withAlpha(88),
              child: FittedBox(
                // clipBehavior: Clip.hardEdge,
                fit: mode,
                  child: Container(
                    width: 80,
                    height: 90,
                    color: Colors.cyanAccent,
                    child: Text(mode.toString().split('.')[0]),
                  ),
              )),
          Text('$mode')
        ]))
            .toList());
  }
}

