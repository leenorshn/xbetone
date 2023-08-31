class User {
  String name;
  String phone;
  String avatar;

  User({required this.name, required this.avatar, required this.phone});

  factory User.fromJson(var json) {
    return User(
      name: json['name'],
      avatar: json['avatar'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "phone": phone,
      "avatar": avatar,
    };
  }
}
