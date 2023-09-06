class Video {
  final String id;
  final String title;
  final String desc;
  final String image;
  final String videoUrl;
  final String chapter;
  final bool isFree;

  Video({
    required this.id,
    required this.title,
    required this.desc,
    required this.image,
    required this.videoUrl,
    required this.chapter,
    required this.isFree,
  });
  factory Video.fromJson(Map json) {
    return Video(
      id: json['_id'],
      title: json['videoTitle'],
      desc: json['viedoDescription'],
      image: json['videoImgUrl'],
      videoUrl: json['videoUrl'],
      chapter: json['videoChapter'],
      isFree: json['isVideoFree'],
    );
  }
}
