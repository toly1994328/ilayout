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
        home: Material(
          child: LoopLayout(),
        ));
  }
}

class LoopLayout extends StatelessWidget {
  const LoopLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            flex: 1,
            child: ColoredBox(color: Colors.red)),
        Expanded(
            flex: 4,
            child: _buildCenter()),
        Expanded(flex: 1,
            child: ColoredBox(color: Colors.blue)),
      ],
    );
  }

  Widget _buildCenter() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            flex: 1,
            child: ColoredBox(color: Colors.orange)),
        Expanded(
            flex: 4,
            child: ColoredBox(color: Colors.cyanAccent)),
        Expanded(
            flex: 1,
            child: ColoredBox(color: Colors.green)),
      ],
    );
  }
}


