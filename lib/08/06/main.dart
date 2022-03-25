import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  Center(
        child: Container(
          width: 200,
          height: 100,
          alignment: Alignment.topLeft,
          color: Colors.grey.withOpacity(0.3),
          child:  ConstrainedBox(
            constraints:const BoxConstraints(
                minWidth: 50,
                minHeight: 40,
                maxWidth: 200,
                maxHeight: 100
            ),
            child: const FittedBox(
                fit: BoxFit.none,
                // fit: BoxFit.scaleDown,
                child: SizedBox(
                    // width: 220,
                    width: 20,
                    height: 30,
                    child:DecoratedBox(decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Color(0xFFF60C0C), Color(0xFFF3B913),
                            Color(0xFFE7F716), Color(0xFF3DF30B),
                            Color(0xFF0DF6EF), Color(0xFF0829FB),
                            Color(0xFFB709F4),
                          ]
                      )
                    ),
                    ),
                )),
          ),
        ),
      ),
    );
  }
}
