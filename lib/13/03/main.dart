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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Wrap(
          spacing: 15,
          children: books
              .map((e) => Alertable(
                    message: e,
                  ))
              .toList(),
        ),
      ),
    );
  }
}

class Alertable extends StatefulWidget {
  final String message;

  const Alertable({Key? key, required this.message}) : super(key: key);

  @override
  _AlertableState createState() => _AlertableState();
}

class _AlertableState extends State<Alertable> {
  OverlayEntry? _entry;

  @override
  Widget build(BuildContext context) {
    return _buildTextItem(widget.message);
  }

  Widget _buildTextItem(String book) {
    return GestureDetector(
      onTap: () => _onTapItem(book),
      child: Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
              color: Colors.blue,
              boxShadow: const [
                BoxShadow(
                    offset: Offset(.5, .5),
                    blurRadius: .5,
                    spreadRadius: .1,
                    color: Colors.blueAccent)
              ],
              borderRadius: BorderRadius.circular(6)),
          child: Text(
            book,
            style: const TextStyle(color: Colors.white),
          )),
    );
  }

  void _onTapItem(String book) {
    _createNewEntry();
  }

  void _createNewEntry() {
    // 获取点击目标尺寸、偏移信息
    Size targetSize = Size.zero;
    Offset targetOffset = Offset.zero;
    RenderObject? renderObject = context.findRenderObject();
    if (renderObject != null && renderObject is RenderBox) {
      targetSize = renderObject.size;
      targetOffset = renderObject.localToGlobal(Offset.zero);
    }

    // 获取 OverlayState
    final OverlayState? overlayState = Overlay.of(context);
    if (overlayState == null) return;

    _entry = OverlayEntry(
        builder: (BuildContext context) => Positioned(
              width: 50,
              height: 50,
              left: targetOffset.dx,
              top: targetOffset.dy,
              child: GestureDetector(
                onTap: removeEntry,
                child: const ColoredBox(color: Colors.red,),
              ),
            ));
    overlayState.insert(_entry!);
  }

  void removeEntry() {
    if (_entry != null) {
      _entry!.remove();
      _entry = null;
    }
  }
}
