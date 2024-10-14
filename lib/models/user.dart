class User {
  final int id;
  final String firebaseUid;
  final String? name;
  final String? email;
  final String? phone;

  User({
    required this.id,
    required this.firebaseUid,
    this.name,
    this.email,
    this.phone,
  });

  // Factory to create User from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firebaseUid: json['firebase_uid'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
    );
  }

  // Convert User to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firebase_uid': firebaseUid,
      'name': name,
      'email': email,
      'phone': phone,
    };
  }
}
