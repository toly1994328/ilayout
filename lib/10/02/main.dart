import 'package:flutter/material.dart';

void main() {
  runApp(
    Directionality(
      textDirection: TextDirection.ltr,
      child: Flex(
        direction: Axis.horizontal,
         children: const [
           Expanded(
             flex: 1,
             child: SizedBox(
               width: 60, height: 60, child: ColoredBox(color: Colors.blue),
             ),
           ),
           Expanded(
             flex: 2,
             child: SizedBox(
               width: 40, height: 40, child: ColoredBox(color: Colors.red),
             ),
           )
         ],
       ),
     ),
  );
}
