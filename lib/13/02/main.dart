import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> books = ['《诗经》', '《资治通鉴》', '《史记》', '《狂人日记》'];

  ValueNotifier<String> info = ValueNotifier('');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Wrap(
              spacing: 15,
              children: books
                  .map((e) => _buildTextItem(e))
                  .toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: ValueListenableBuilder(valueListenable: info, builder: (_,String value,__)=>Text(value)),
          )
        ],
      ),
    );
  }

  Widget _buildTextItem(String book) {
    return Builder(
      builder: (BuildContext ctx) => GestureDetector(
        onTap: () => _onTapItem(ctx),
        child: Container(
            padding:  const EdgeInsets.all(3),
            decoration:  BoxDecoration(
                color: Colors.blue,
                boxShadow: const [BoxShadow(offset: Offset(.5, .5), blurRadius: .5, spreadRadius: .1, color: Colors.blueAccent)],
                borderRadius: BorderRadius.circular(6)),
            child: Text(book, style:  const TextStyle(color: Colors.white))),
      ),
    );
  }

  void _onTapItem(BuildContext context) {
    RenderObject? renderObject = context.findRenderObject();
    if(renderObject!=null && renderObject is RenderBox){
      Size size = renderObject.size;
      Offset offset = renderObject.localToGlobal(Offset.zero);
      info.value = '尺寸: $size\n左上角坐标: $offset';
    }
  }
}

