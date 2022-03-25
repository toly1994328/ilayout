import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Material(
          child: NXMLayout(
            n: 3,
            m: 3,
          ),
        ));
  }
}

class NXMLayout extends StatelessWidget {

  NXMLayout({Key? key, this.n = 3, this.m = 3}) : super(key: key);

  final int n; // 行数
  final int m; // 列数

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    for (int i = 0; i < n; i++) {
      children.add(Expanded(child: ColoredBox(color: randomColor())));
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: children,
    );
  }

  // 随机色
  final Random random = Random();

  Color randomColor({
    int limitA = 120,
    int limitR = 0,
    int limitG = 0,
    int limitB = 0,
  }) {
    int a = limitA + random.nextInt(256 - limitA); //透明度值
    int r = limitR + random.nextInt(256 - limitR); //红值
    int g = limitG + random.nextInt(256 - limitG); //绿值
    int b = limitB + random.nextInt(256 - limitB); //蓝值
    return Color.fromARGB(a, r, g, b); //生成argb模式的颜色
  }
}
