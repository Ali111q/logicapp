class User {
  String id;
  String name;
  String email;
  String token;

  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.token});
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['userId'],
      name: json['username'],
      email: json['email'],
      token: json['token'],
    );
  }
}
