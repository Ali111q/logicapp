class Course{
  final String id;
  final String name;
  final String image;
  final List videos;

  Course({required this.id, required this.name, required this.image, required this.videos});
  factory Course.fromJson(Map json){
    return Course(id: json['_id'], name: json['courseTitle'], image: json['courseImg'], videos: json['courseVideos']);
  }
  
}