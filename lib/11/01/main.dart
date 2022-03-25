import 'package:flutter/material.dart';

void main() {
  runApp(
    Align(
      alignment: Alignment.center,
      child: ColoredBox(
        color: Colors.orange.withOpacity(0.2),
        child: CustomSingleChildLayout(
          delegate: PolarLayoutDelegate(),
          child: const SizedBox(
            width: 20,
            height: 20,
            child: ColoredBox(color: Colors.blue),
          ),
        ),
      ),
    ),
  );
}

class PolarLayoutDelegate extends SingleChildLayoutDelegate {
  @override
  bool shouldRelayout(covariant SingleChildLayoutDelegate oldDelegate) => false;

  @override
  Size getSize(BoxConstraints constraints) {
    final radius = constraints.biggest.shortestSide;
    return Size(radius, radius);
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    return const Offset(10, 10);
  }

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return constraints.loosen();
  }
}
