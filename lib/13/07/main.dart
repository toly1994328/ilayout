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

  Map<String, String> introductionMap = {
    '《诗经》': '《诗经》，是中国古代诗歌开端，最早的一部诗歌总集，收集了西周初年至春秋中叶（前11世纪至前6世纪）的诗歌，共311篇。',
    '《资治通鉴》': '《资治通鉴》，是由北宋史学家司马光主编的一部多卷本编年体史书，共294卷，历时十九年完成。',
    '《史记》':
        '《史记》，二十四史之一，最初称为《太史公书》或《太史公记》、《太史记》，是西汉史学家司马迁撰写的纪传体史书，是中国历史上第一部纪传体通史。',
    '《狂人日记》':
        '《狂人日记》是鲁迅创作的第一个短篇白话文日记体小说，也是中国第一部现代白话小说。该文首发于1918年5月15日4卷5号的《新青年》月刊，后收入《呐喊》集。',
    '《西游记》':
        '《西游记》是中国古代第一部浪漫主义章回体长篇神魔小说。现存明刊百回本《西游记》均无作者署名，清代学者吴玉搢等首先提出《西游记》作者是明代吴承恩。',
    '《红楼梦》':
        '《红楼梦》是中国古代章回体长篇小说，中国古典四大名著之一，通行本共120回，一般认为前80回是清代作家曹雪芹所著，后40回作者为无名氏，整理者为程伟元、高鹗。',
    '《三国演义》':
        '《三国演义》是元末明初小说家罗贯中根据陈寿《三国志》和裴松之注解以及民间三国故事传说经过艺术加工创作而成的长篇章回体历史演义小说。',
    '《水浒传》': '《水浒传》是元末明初施耐庵（现存刊本署名大多有施耐庵、罗贯中两人中的一人，或两人皆有）编著的章回体长篇小说。',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('HomePage'),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Wrap(
          spacing: 15,
          children: books
              .map((e) => Alertable(
                    content : buildContent(e),
                    alertContent: Text(
                      introductionMap[e] ?? '暂无简介',
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }

  Widget buildContent(String name){
    return Container(
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
          name,
          style: const TextStyle(color: Colors.white),
        ));
  }
}

class Alertable extends StatefulWidget {
  final Widget content;
  final Widget alertContent;

  const Alertable({Key? key, required this.content, required this.alertContent})
      : super(key: key);

  @override
  _AlertableState createState() => _AlertableState();
}

class _AlertableState extends State<Alertable>
    with SingleTickerProviderStateMixin {
  OverlayEntry? _entry;
  static const Duration _fadeInDuration = Duration(milliseconds: 150);
  static const Duration _fadeOutDuration = Duration(milliseconds: 75);
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: _fadeInDuration,
      reverseDuration: _fadeOutDuration,
      vsync: this,
    )..addStatusListener(_handleStatusChanged);
  }

  void _handleStatusChanged(AnimationStatus status) {
    if (status == AnimationStatus.dismissed && _entry != null) {
      removeEntry();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onTapItem(),
      child: widget.content,
    );
  }

  void _onTapItem() {
    _createNewEntry();
    _controller.forward();
  }

  void _createNewEntry() {
    Size targetSize = Size.zero;
    Offset targetOffset = Offset.zero;
    RenderObject? renderObject = context.findRenderObject();
    final double boxWidth = 250;
    final double marginTop = 4;
    final EdgeInsets padding = EdgeInsets.symmetric(horizontal: 8, vertical: 4);

    double spineOffset = (boxWidth - 6) / 2;
    double winWidth = MediaQuery.of(context).size.width;
    // 获取点击目标尺寸、偏移信息
    if (renderObject != null && renderObject is RenderBox) {
      targetSize = renderObject.size;
      Offset offset = Offset(
          targetSize.width / 2 - boxWidth / 2, targetSize.height + marginTop);
      Offset topLeftOffset = renderObject.localToGlobal(Offset.zero);
      // 校验是否左侧越界
      bool outLeft = topLeftOffset.dx + targetSize.width / 2 < boxWidth / 2;
      bool outRight =
          topLeftOffset.dx + targetSize.width / 2 + boxWidth / 2 > winWidth;
      if (outLeft) {
        targetOffset = Offset(
          topLeftOffset.dx,
          topLeftOffset.dy + offset.dy,
        );
        spineOffset = (targetSize.width - 6) / 2;
      } else if (outRight) {
        targetOffset = Offset(
          topLeftOffset.dx - boxWidth + targetSize.width,
          topLeftOffset.dy + offset.dy,
        );
        spineOffset = boxWidth - (targetSize.width + 6) / 2;
      } else {
        targetOffset = topLeftOffset + offset;
      }
    }

    // 获取 OverlayState
    final OverlayState? overlayState = Overlay.of(context);
    if (overlayState == null) return;

    _entry = OverlayEntry(
        builder: (BuildContext context) => FadeTransition(
              opacity: _controller,
              child: Material(
                color: Colors.transparent,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: hide,
                  child: Stack(
                    children: [
                      Positioned(
                        width: boxWidth,
                        left: targetOffset.dx,
                        top: targetOffset.dy,
                        child: GestureDetector(
                          onTap: hide,
                          child: Wrapper(
                            padding: padding,
                            spineType: SpineType.top,
                            offset: spineOffset,
                            elevation: 1,
                            angle: 60,
                            spineHeight: 6,
                            color: const Color(0xff95EC69),
                            child: widget.alertContent,
                          ),
                        ),
                      ),
                    ],  
                  ),
                ),
              ),
            ));
    overlayState.insert(_entry!);
  }

  void hide() {
    if (_entry != null) {
      _controller.reverse();
    }
  }

  void removeEntry() {
    if (_entry != null) {
      _entry!.remove();
      _entry = null;
    }
  }
}
