class TimeNode {
  final String title;
  final String time;
  final String content;
  final String? imageUrl;

  TimeNode(
      {required this.title,
      required this.time,
      required this.content,
        this.imageUrl});

  @override
  String toString() {
    return 'TimeNode{title: $title, time: $time, content: $content, imageUrl: $imageUrl}';
  }
}
