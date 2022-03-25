import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(Directionality(
    textDirection: TextDirection.ltr,
    child: const FlowMenu()));



class FlowMenu extends StatelessWidget {

  static const List<IconData> menuItems = <IconData>[
    // Icons.menu,
    Icons.home,
    Icons.new_releases,
    Icons.notifications,
    Icons.settings,
    Icons.refresh,
    Icons.close,
  ];

  const FlowMenu({Key? key}) : super(key: key);

  Widget flowMenuItem(IconData icon) {
    return RawMaterialButton(
      fillColor: Colors.blue,
      splashColor: Colors.amber[100],
      shape: const CircleBorder(),
      constraints: BoxConstraints.tight(const Size(40, 40)),
      onPressed: () {

      },
      child: Icon(
        icon,
        color: Colors.white,
        size: 25.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: ColoredBox(
        color: Colors.orange.withOpacity(0.2),
        child: Flow(
          delegate: CircleFlowDelegate(),
          children:
          menuItems.map<Widget>((IconData icon) => flowMenuItem(icon)).toList(),
        ),
      ),
    );
  }
}

class CircleFlowDelegate extends FlowDelegate {

  @override
  bool shouldRepaint(CircleFlowDelegate oldDelegate) {
    return true;
  }

  @override
  Size getSize(BoxConstraints constraints) {
    final radius = constraints.biggest.shortestSide;
    return Size(radius, radius);
  }

  @override
  BoxConstraints getConstraintsForChild(int i, BoxConstraints constraints) {
    return constraints.loosen();
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    final double radius = context.size.shortestSide / 2;
    final int count = context.childCount;
    final double perRad = 2 * pi / count;
    for (int i = 0; i < count; i++) {
      final Size size = context.getChildSize(i) ?? Size.zero;
      final double offsetX = (radius - size.width / 2) * cos(i * perRad) + radius;
      final double offsetY = (radius - size.height / 2) * sin(i * perRad) + radius;
      context.paintChild(i,
          transform: Matrix4.translationValues(
              offsetX - size.width / 2, offsetY - size.height / 2, 0.0));
    }
  }
}