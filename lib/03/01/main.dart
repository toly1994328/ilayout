import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Material(child: LoopLayout()),
    );
  }
}

class LoopLayout extends StatelessWidget {
  final Widget? center;
  final int shift;

  const LoopLayout({Key? key, this.center, this.shift = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: const [
        SizedBox(width: 50, height: 50, child: ColoredBox(color: Colors.red)),
      ],
    );
  }
}
