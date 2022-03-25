import 'package:flutter/material.dart';

void main() {
  runApp(Directionality(
    textDirection: TextDirection.ltr,
    child: IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            // height: 120,
            color: Colors.red,
          ),
          Column(
            children: [
              Container(
                width: 100,
                height: 20,
                color: Colors.blue,
              ),
              Container(
                width: 100,
                height: 40,
                color: Colors.green,
              ),
              Container(
                width: 100,
                color: Colors.green,
              )
            ],
          )
        ],
      ),
    ),
  ));
}
