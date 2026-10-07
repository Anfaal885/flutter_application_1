import 'dart:convert';

import 'package:http/http.dart' as http;

import 'user.dart';

class UserApiService {
  static const String _baseUrl =
      'https://jsonplaceholder.typicode.com';

  Future<List<User>> fetchUsers() async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/users'),
        headers: {
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonData =
            jsonDecode(response.body);

        return jsonData
            .map(
              (json) => User.fromJson(
                json as Map<String, dynamic>,
              ),
            )
            .toList();
      }

      throw Exception(
        'Server error: ${response.statusCode}',
      );
    } catch (e) {
      throw Exception('Failed to fetch users: $e');
    }
  }
}