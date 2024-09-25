class User {
  final String name;
  final String email;
  final String? avatarUrl;

  User({required this.name, required this.email, this.avatarUrl});

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        avatarUrl = json['avatarUrl'];

  Map<String, dynamic> toJson(Map<String, dynamic> data) {
    data['name'] = name;
    data['email'] = email;
    data['avatarUrl'] = avatarUrl;

    return data;
  }
}
