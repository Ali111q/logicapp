class University {
  final String id;
  final String name;
  final String image;
  final List collages;

  University(
      {required this.id,
      required this.name,
      required this.image,
      required this.collages});
  factory University.fromJson(Map json) {
    return University(
        id: json['_id'],
        name: json['universityName'],
        image: json['universityImgUrl'],
        collages: json['universityColleages']);
  }
}
