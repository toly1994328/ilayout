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
        Wrap(
          direction: Axis.vertical,
          children: [
            Container(
              color: Colors.blue,
              width: 100,
              height: 100,
            ),
            LayoutBuilder(
                builder: (_, constraints) {
                  print(constraints);
                  return Container(
                    color: Colors.red,
                    width: 100,
                    height: 100,
                  );
                }
            ),
            LayoutBuilder(
                builder: (_, constraints) {
                  print(constraints);
                  return Container(
                    color: Colors.green,
                    width: 100,
                    height: 100,
                  );
                }
            ),

            LayoutBuilder(
                builder: (_, constraints) {
                  print(constraints);
                  return Container(
                    color: Colors.yellow,
                    width: 100,
                    height: 100,
                  );
                }
            ),
          ],
        ),
      );
  }
}













