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
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: NXMLayout(
              n: 6,
              m: 2,
            ),
          ),
        ));
  }
}

class NXMLayout extends StatelessWidget {
  // 行数
  final int n;

  // 列数
  final int m;

  NXMLayout({Key? key, this.n = 3, this.m = 3}) : super(key: key);

  Widget get decoratedBox {
    return DecoratedBox(
      decoration:
          BoxDecoration(border: Border.all(color: randomColor(), width: 1)),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    for (int i = 0; i < n; i++) {
      List<Widget> columnChildren = [];
      for (int j = 0; j < m; j++) {
        columnChildren.add(
          Expanded(
            child: ColoredBox(
              // color: randomColor(),
              color: Colors.transparent,
              child: buildZone(j, i),
            ),
          ),
        );
      }
      children.add(Expanded(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: columnChildren,
      )));
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: children,
    );
  }

  List<String> imagePaths = [
    'icon_5.jpg', 'icon_6.jpg', 'icon_7.jpg',
    'icon_8.jpg', 'icon_9.jpg', 'icon_10.jpg',
    'icon_11.jpg', 'icon_12.jpg', 'icon_13.jpg',
    'icon_28.jpg',
  ];

  Widget buildZone(int x, int y) {
    int index = x * n + y;
    // int index = y * m + x;
    // int index = (n - y - 1) * m + x;
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Image.asset(
        'assets/images/head_icon/${imagePaths[index % imagePaths.length]}',
        fit: BoxFit.cover,
      ),
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
