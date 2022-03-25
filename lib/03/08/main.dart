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
            n: 8,
            m: 6,
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
              color: randomColor(),
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


  // List<int> data = List.generate(100, (index) => index + 1);
  String src =
      '燕子去了，有再来的时候；杨柳枯了，有再青的时候；桃花谢了，有再开的时候。但是，聪明的，你告诉我，我们的日子为什么一去不复返呢？——是有人偷了他们罢：那是谁？又藏在何处呢？是他们自己逃走了罢：如今又到了哪里呢？';

  Widget buildZone(int x, int y) {
    // int index = x * n + y;
    // int index = y * m + x;
    int index = (n-y-1) * m + x;

    //    if (index >= src.length) {
    //       return const SizedBox.shrink();
    //     }

    return Center(
        child: Text(
      // '$index',
      // '($x,$y)',
      src[index],
      style: const TextStyle(color: Colors.white),
    ));
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
