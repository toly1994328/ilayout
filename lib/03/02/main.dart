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
        SizedBox(width: 50, child: ColoredBox(color: Colors.red)),
        Expanded(child: ColoredBox(color: Colors.cyanAccent)),
        // 上行等价于
        // Flexible(fit:FlexFit.tight,child: ColoredBox(color: Colors.cyanAccent)),

        // Spacer(),
        SizedBox(width: 50, child: ColoredBox(color: Colors.blue)),
      ],
    );
  }
}

class Spacer extends Flexible {
  const Spacer({
    Key? key,
    int flex = 1,
  })  : assert(flex > 0),
        super(
          key: key,
          flex: flex,
          fit: FlexFit.tight,
          child: const SizedBox.shrink(),
        );
}
