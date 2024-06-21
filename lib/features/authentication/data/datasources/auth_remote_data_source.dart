// lib/data/datasources/auth_remote_data_source.dart
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/user_model.dart';

class AuthRemoteDataSource {
  static const String baseUrl = 'https://itirena-backend.onrender.com/api/v1';

  Future<UserModel> login(String userNameOrEmail, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body:
          jsonEncode({'userName/email': userNameOrEmail, 'password': password}),
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(jsonDecode(response.body)['error']);
    }
  }

  Future<String> signup(String userName, String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/signup'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(
          {'userName': userName, 'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['message'];
    } else {
      throw Exception(jsonDecode(response.body)['error']);
    }
  }

  Future<String> resetPassword(String email) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/reset-account'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['message'];
    } else {
      throw Exception(jsonDecode(response.body)['error']);
    }
  }
}
