// lib/domain/entities/user.dart
class User {
  final String userName;
  final String email;
  String? token;

  User({
    required this.userName,
    required this.email,
    this.token,
  });
}
