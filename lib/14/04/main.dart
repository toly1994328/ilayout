import 'package:dash_painter/dash_painter.dart';
import 'package:flutter/material.dart';
import 'package:wrapper/wrapper.dart';

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
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //   title: Text('时光轴测试'),
      // ),
      body: Container(
        margin: EdgeInsets.only(top: 46),
        child: Column(
          children: [
            TimeLineNode(),
            // TimeLineNode2(),
          ],
        ),
      ),
    );
  }
}

class TimeLineNode extends StatelessWidget {
  const TimeLineNode({Key? key}) : super(key: key);

  final double dashLineWith = 20;
  final double marginTop = 10;
  final double offset = 20 + 10;
  final double lineWidth = 2;
  final double circleRadius = 5;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          _buildDecoration(),
          Expanded(flex: 5, child: _buildCenterWidget()),
          const Spacer(flex: 2)
        ],
      ),
    );
  }

  Widget _buildDecoration() => Container(
        margin: const EdgeInsets.only(left: 20),
        width: dashLineWith,
        decoration: DashDecoration(
            circleColor: Colors.blueAccent,
            lineColor: Colors.white,
            circleRadius: circleRadius,
            color: Colors.white,
            circleOffset: Offset(lineWidth / 2, offset + 10 / 2)),
      );

  Widget _buildCenterWidget() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Wrapper(
        color: Colors.white,
        offset: 20 + 10 / 2 - 6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'FlutterUnit 正式开源',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: const Text(
                'V1.0 版本: 核心功能是组件集录，此时收录 200+ 组件的基本使用方式。',
                style: TextStyle(
                    color: Color(
                      (0xffCBCBCB),
                    ),
                    fontSize: 12,
                    shadows: [
                      Shadow(color: Colors.blueAccent, blurRadius: .1)
                    ]),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(vertical: 5),
              child: Image(
                image: AssetImage(
                  'assets/images/node1.webp',
                ),
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            const Text('2020-04-15',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}

class DashDecoration extends Decoration {
  final Color color;
  final Color circleColor;
  final Color lineColor;
  final Offset circleOffset;
  final double circleRadius;

  const DashDecoration(
      {required this.color,
      required this.circleColor,
      required this.lineColor,
      required this.circleOffset,
      required this.circleRadius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) =>
      DashBoxPainter(decoration: this);
}

class DashBoxPainter extends BoxPainter {
  final DashDecoration decoration;

  const DashBoxPainter({required this.decoration});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    canvas.save();
    final Paint paint = Paint()..style = PaintingStyle.stroke;
    final Path path = Path();
    canvas.translate(
      offset.dx,
      offset.dy,
    );
    // 绘制直线
    canvas.drawLine(
        Offset(-decoration.circleOffset.dx, 0),
        Offset(-decoration.circleOffset.dx, configuration.size!.height),
        paint
          ..color = decoration.lineColor
          ..strokeWidth = 2);

    // 绘制虚线
    path
      ..moveTo(0, decoration.circleOffset.dy)
      ..relativeLineTo(configuration.size!.width, 0);
    const DashPainter(span: 2, step: 3).paint(
        canvas,
        path,
        paint
          ..color = decoration.color
          ..strokeWidth = 1);

    //绘制圆点
    final Paint paint2 = Paint()..color = Colors.white;
    canvas.drawCircle(
        Offset(-decoration.circleOffset.dx, decoration.circleOffset.dy),
        decoration.circleRadius,
        paint2);
    canvas.drawCircle(
        Offset(-decoration.circleOffset.dx, decoration.circleOffset.dy),
        decoration.circleRadius * 0.6,
        paint2..color = decoration.circleColor);
    canvas.restore();
  }
}
