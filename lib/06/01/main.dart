
import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final List<SpecialColumnItem> data = [
    SpecialColumnItem(
      title: "Flutter 基础",
      url: "assets/images/draw_bg3.webp",
      articleCount: 97,
      attentionCount: 188,
    ),
    SpecialColumnItem(
      title: "FlutterUnit 周边",
      url: "assets/images/draw_bg4.webp",
      articleCount: 90,
      attentionCount: 128,
    ),
    SpecialColumnItem(
      title: "Flutter 绘制集录",
      url: "assets/images/base_draw.webp",
      articleCount: 29,
      attentionCount: 118,
    ),
    SpecialColumnItem(
      title: "Flutter 动画集录",
      url: "assets/images/anim_draw.webp",
      articleCount: 34,
      attentionCount: 18,
    ),
    SpecialColumnItem(
      title: "Flutter 玩转正则",
      url: "assets/images/draw_bg3.webp",
      articleCount: 7,
      attentionCount: 88,
    ),
    SpecialColumnItem(
      title: "Rust 学习指南",
      url: "assets/images/draw_bg4.webp",
      articleCount: 90,
      attentionCount: 228,
    ),
    SpecialColumnItem(
      title: "Vue 学习指南",
      url: "assets/images/base_draw.webp",
      articleCount: 90,
      attentionCount: 128,
    ),
    SpecialColumnItem(
      title: "前端绘制宝典",
      url: "assets/images/anim_draw.webp",
      articleCount: 19,
      attentionCount: 1228,
    ),
    SpecialColumnItem(
      title: "Flutter 基础",
      url: "assets/images/draw_bg3.webp",
      articleCount: 97,
      attentionCount: 188,
    ),
    SpecialColumnItem(
      title: "FlutterUnit 周边",
      url: "assets/images/draw_bg4.webp",
      articleCount: 90,
      attentionCount: 128,
    ),
    SpecialColumnItem(
      title: "Flutter 绘制集录",
      url: "assets/images/base_draw.webp",
      articleCount: 90,
      attentionCount: 128,
    ),
    SpecialColumnItem(
      title: "Flutter 动画集录",
      url: "assets/images/anim_draw.webp",
      articleCount: 90,
      attentionCount: 128,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(),
        body: ListView.separated(
            itemBuilder: (_, index) => SpecialColumn(
                  item: data[index],
                ),
            separatorBuilder: (_, index) => const Divider(height: 1),
            itemCount: data.length),
      ),
    );
  }
}

class SpecialColumnItem {
  final String url;
  final String title;
  final int articleCount;
  final int attentionCount;

  SpecialColumnItem(
      {required this.url,
      required this.title,
      required this.articleCount,
      required this.attentionCount});
}

class SpecialColumn extends StatelessWidget {
  final SpecialColumnItem item;

  const SpecialColumn({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 86,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImage(),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [_buildTitle(), _buildFoot()],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFoot() {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.center,
      spacing: 4,
      children: [
        Text(
          '${item.articleCount} 篇文章',
          style: const TextStyle(
              fontSize: 12, height: 1, color: Color(0xff86909c)),
        ),
        Container(
          width: 2,
          height: 2,
          decoration: const BoxDecoration(
              color: Color(0xff86909c), shape: BoxShape.circle),
        ),
        Text(
          '${item.attentionCount} 人关注',
          style: const TextStyle(
              fontSize: 12, height: 1, color: Color(0xff86909c)),
        ),
      ],
    );
  }

  Widget _buildTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          item.title,
          style: const TextStyle(fontSize: 16, color: Color(0xff2F3032)),
        ),
        const Icon(Icons.more_horiz, size: 20, color: Color(0xff8D8D8D))
      ],
    );
  }

  Widget _buildImage() {
    return AspectRatio(
      aspectRatio: 1,
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            image: DecorationImage(
              image: AssetImage(
                item.url,
              ),
              fit: BoxFit.cover,
            )),
      ),
    );
  }
}
