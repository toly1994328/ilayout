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

class _FlowMenuState extends State<FlowMenu>
    with SingleTickerProviderStateMixin {
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
      constraints: BoxConstraints.tight(const Size(35, 35)),
      onPressed: () {
        menuAnimation.status == AnimationStatus.completed
            ? menuController.reverse()
            : menuController.forward();
      },
      child: Icon(
        icon,
        color: Colors.white,
        size: 22.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: ColoredBox(
        color: Colors.orange.withOpacity(0),
        child: Flow(
          delegate: CircleFlowDelegate(
            menuAnimation: menuAnimation,
            location: MenuLocation.centerLeft,
          ),
          children: FlowMenu.menuItems
              .map<Widget>((IconData icon) => flowMenuItem(icon))
              .toList(),
        ),
      ),
    );
  }
}

enum MenuLocation {
  topRight,
  centerLeft,
  bottomLeft,
}

class CircleFlowDelegate extends FlowDelegate {
  CircleFlowDelegate({
    required this.menuAnimation,
    this.location = MenuLocation.centerLeft,
  }) : super(repaint: menuAnimation);

  final Animation<double> menuAnimation;
  final MenuLocation location;

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
    if (context.childCount == 0) return;
    final double radius = context.size.shortestSide / 2;

    final int count = context.childCount - 1;
    double angle = 90;
    double progress = menuAnimation.value;
    final double perRad = angle / 180 * pi / (count - 1);
    double fixRotate = 0;
    switch (location) {
      case MenuLocation.topRight:
        fixRotate = 0;
        break;
      case MenuLocation.centerLeft:
        fixRotate = (angle / 2) / 180 * pi;
        break;
      case MenuLocation.bottomLeft:
        fixRotate = 90 / 180 * pi;
        break;
    }
    if (progress != 0) {
      for (int i = 0; i < count; i++) {
        final Size size = context.getChildSize(i) ?? Size.zero;
        final double offsetX =
            progress * (radius - size.width / 2) * cos(i * perRad - fixRotate) +
                radius;
        final double offsetY = progress *
                (radius - size.height / 2) *
                sin(i * perRad - fixRotate) +
            radius;

        Offset fix = fixOffset(radius, size);

        context.paintChild(i + 1,
            transform: Matrix4.translationValues(
              offsetX - size.width / 2 - fix.dx,
              offsetY - size.height / 2 - fix.dy,
              0.0,
            ));
      }
    }

    final Size menuSize = context.getChildSize(0) ?? Size.zero;
    Offset fix = fixOffset(radius, menuSize);
    context.paintChild(0,
        transform: Matrix4.translationValues(
            radius - menuSize.width / 2 - fix.dx,
            radius - menuSize.height / 2 - fix.dy,
            0.0));
  }

  Offset fixOffset(double radius, Size childSize) {
    double fixOffsetX = 0;
    double fixOffsetY = 0;
    switch (location) {
      case MenuLocation.topRight:
        fixOffsetX = radius - childSize.width / 2;
        fixOffsetY = radius - childSize.height / 2;
        break;
      case MenuLocation.centerLeft:
        fixOffsetX = radius - childSize.width / 2;
        fixOffsetY = 0;
        break;
      case MenuLocation.bottomLeft:
        fixOffsetX = radius - childSize.width / 2;
        fixOffsetY = -(radius - childSize.height / 2);
        break;
    }
    return Offset(fixOffsetX, fixOffsetY);
  }
}
