// lib/data/models/user_model.dart
class UserModel {
  final String userName;
  final String email;
  String? token;

  UserModel({required this.userName, required this.email, this.token});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userName: json['userName'] ?? "",
      email: json['email'] ?? "",
      token: json['token'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'email': email,
      'token': token,
    };
  }
}
