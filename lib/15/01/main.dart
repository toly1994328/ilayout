import 'package:flutter/material.dart';

void main() {
  runApp(  Directionality(
    textDirection: TextDirection.ltr,
    child: Align(
      alignment: Alignment.topLeft,
      child: _buildContent(),
    ),
  ));
}

// Widget _buildContent() {
//   return const Padding(
//     padding: EdgeInsets.all(10),
//     child: ColoredBox(
//       color: Colors.blue,
//       child: SizedBox(
//         width: 100,
//         height: 100,
//         child:Padding(
//           padding:  EdgeInsets.all(10.0),
//           child: Align(
//               alignment: Alignment.topLeft,
//               child: Icon(Icons.android,color: Colors.white,)),
//         ),
//       ),
//     ),
//   );
// }

Widget _buildContent() {
  return Container(
    width: 100,
    height: 100,
    color: Colors.blue,
    margin: const EdgeInsets.all(10),
    padding: const EdgeInsets.all(10),
    alignment: Alignment.topLeft,
    child:const Icon(Icons.android,color: Colors.white,),
  );
}



