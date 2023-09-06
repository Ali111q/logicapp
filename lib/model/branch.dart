class Branch {
  final String id;
  final String name;
  final List courses;


  Branch({required this.id, required this.name, required this.courses});
  factory Branch.fromJson(Map json){
    return Branch(id: json['_id'], name: json['branchName'], courses: json['courses']);
  }
}
