import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
        home:
        // Flex(
        Stack(
          fit: StackFit.expand,
          children: [
            LayoutBuilder(
                builder: (_, constraints) {
                  print(constraints);
                  return Container(
                    color: Colors.yellow,
                    width: 140,
                    height: 140,
                  );
                }
            ),
            LayoutBuilder(
                builder: (_, constraints) {
                  // print(constraints);
                  return Container(
                    color: Colors.green,
                    width: 110,
                    height: 110,
                  );
                }
            ),
            LayoutBuilder(
                builder: (_, constraints) {
                  // print(constraints);
                  return Container(
                    color: Colors.red,
                    width: 80,
                    height: 80,
                  );
                }
            ),
            Container(
              color: Colors.blue,
              width: 50,
              height: 50,
            ),
          ],
        ),
      );
  }
}













