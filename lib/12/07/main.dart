import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(
    Directionality(textDirection: TextDirection.ltr, child: const FlowMenu()));

class FlowMenu extends StatefulWidget {
  static const List<IconData> menuItems = <IconData>[
    Icons.menu,
    Icons.home,
    Icons.new_releases,
    Icons.notifications,
    Icons.settings,
    // Icons.refresh,
    // Icons.close,
  ];

  const FlowMenu({Key? key}) : super(key: key);

  @override
  State<FlowMenu> createState() => _FlowMenuState();
}

class _FlowMenuState extends State<FlowMenu>  with SingleTickerProviderStateMixin{
  late AnimationController menuController;
  late Animation<double> menuAnimation;
  @override
  void initState() {
    super.initState();
    menuController = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    menuAnimation = CurveTween(curve: Curves.ease).animate(menuController);
  }

  Widget flowMenuItem(IconData icon) {
    return RawMaterialButton(
      fillColor: Colors.blue,
      // splashColor: Colors.amber[100],
      shape: const CircleBorder(),
      constraints: BoxConstraints.tight(const Size(40, 40)),
      onPressed: () {
        menuAnimation.status == AnimationStatus.completed
            ? menuController.reverse()
            : menuController.forward();
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
          delegate: CircleFlowDelegate(menuAnimation: menuAnimation),
          children: FlowMenu.menuItems
              .map<Widget>((IconData icon) => flowMenuItem(icon))
              .toList(),
        ),
      ),
    );
  }
}

class CircleFlowDelegate extends FlowDelegate {

  CircleFlowDelegate({required this.menuAnimation})
      : super(repaint: menuAnimation);

  final Animation<double> menuAnimation;

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
    if(context.childCount==0) return;
    final double radius = context.size.shortestSide / 2;

    final int count = context.childCount-1;
    double angle = 120;
    double progress = menuAnimation.value;
    final double perRad = angle / 180 * pi / (count-1);
    final double fixRotate = (angle / 2) / 180 * pi;
    if(progress!=0){
      for (int i = 0; i < count; i++) {
        final Size size = context.getChildSize(i) ?? Size.zero;
        final double offsetX = progress*(radius - size.width / 2) * cos(i * perRad - fixRotate) + radius;
        final double offsetY = progress*(radius - size.height / 2) * sin(i * perRad - fixRotate) + radius;
        context.paintChild(i+1,
            transform: Matrix4.translationValues(
                offsetX - size.width / 2, offsetY - size.height / 2, 0.0));
      }
    }


    final Size menuSize = context.getChildSize(0) ?? Size.zero;
    context.paintChild(0,
        transform: Matrix4.translationValues(
            radius - menuSize.width / 2, radius - menuSize.height / 2, 0.0));
  }
}
