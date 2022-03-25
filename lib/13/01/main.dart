import 'package:flutter/material.dart';

void main() {
  runApp(const Align(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: 50,
      height: 50,
      child: GestureDetector(
        onTap: ()=>printInfo(context),
        child:  ColoredBox(
        color: Colors.blue,
      ),

      ),
    );
  }

  void printInfo(BuildContext context){
    RenderObject? renderObject = context.findRenderObject();
    if(renderObject!=null && renderObject is RenderBox){
      print(renderObject.size);
      print(renderObject.localToGlobal(Offset.zero));
    }
  }

}

