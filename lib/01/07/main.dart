// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(
//     CustomSingleChildLayout(
//       delegate: DiyLayoutDelegate(),
//       child: const ColoredBox(color: Colors.blue),
//     ),
//   );
// }
//
// class DiyLayoutDelegate extends SingleChildLayoutDelegate {
//   @override
//   bool shouldRelayout(covariant SingleChildLayoutDelegate oldDelegate) => false;
//
//   // @override
//   // Size getSize(BoxConstraints constraints) {
//   //   print("getSize====constraints:${constraints}");
//   //   return super.getSize(constraints);
//   // }
//
//   // @override
//   // Offset getPositionForChild(Size size, Size childSize) {
//   //   print("getPositionForChild====size:${size}====childSize:${childSize}");
//   //   return Offset(100, 100);
//   //   // return super.getPositionForChild(size, childSize);
//   // }
//
//   @override
//   BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
//     print("getConstraintsForChild====constraints:${constraints}");
//     // return BoxConstraints.tight(const Size(100, 100));
//     // return BoxConstraints.expand();
//     return BoxConstraints.loose(constraints.biggest);
//   }
// }
