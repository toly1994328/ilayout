import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    Align(
      alignment: Alignment.center,
      child: ColoredBox(
        color: Colors.orange.withOpacity(0.2),
        child: CustomSingleChildLayout(
          delegate: PolarLayoutDelegate(
              polar: Polar(len: 0.6, deg: 45 * pi / 180)),
          child: const SizedBox(
            width: 20,
            height: 20,
            child: ColoredBox(
              color: Colors.blue,
              child: Center(
                  child: Text(
                    '子',
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ),
        ),
      ),
    ),
  );
}

class Polar {
  final double len;
  final double deg;

  Polar({required this.len, required this.deg});
}

class PolarLayoutDelegate extends SingleChildLayoutDelegate {
  final Polar polar;

  PolarLayoutDelegate({required this.polar});

  @override
  bool shouldRelayout(covariant PolarLayoutDelegate oldDelegate) =>
      oldDelegate.polar != polar;

  @override
  Size getSize(BoxConstraints constraints) {
    final radius = constraints.biggest.shortestSide;
    return Size(radius, radius);
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    double r = size.width / 2 * polar.len;
    Offset center = Offset(size.width / 2, size.height / 2);
    Offset offset = Offset(r * cos(polar.deg), r * sin(polar.deg));
    Offset childSizeOffset = Offset(childSize.width / 2, childSize.height / 2);
    return center + offset - childSizeOffset;
  }

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return constraints.loosen();
  }
}
