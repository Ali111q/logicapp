class Collage{
  final String id;
  final String name;
  final List branches;
  Collage({required this.id, required this.name, required this.branches });
  factory Collage.fromJson(Map json){
    return Collage( id: json['_id'], name: json['colleageName'], branches: json['colleageBranches']);
  }
}