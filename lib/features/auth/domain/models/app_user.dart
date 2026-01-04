class AppUser {
  final String uid;
  final String name;
  final String email;
  final String? photo;

  AppUser({
    required this.uid,
    required this.name,
    required this.email,
    this.photo,
  });

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'photo': photo,
    };
  }

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      uid: json['uid'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      photo: json['photo'] as String?,
    );
  }
}
