import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:test_app/entity/auth/login_entity.dart';

class LoginRepository {
  Future<Map<String, dynamic>> login(LoginEntity loginEntity) async {
    try {
      final uri = Uri.parse('http://localhost/api/auth/login');
      final response = await http.post(
        uri,
        body: {
          'email': loginEntity.email,
          'password': loginEntity.password,
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        return {
          'success': true,
          'token': data['authorization']['token'],
          'user': data['user'],
        };
      } else {
        return {
          'success': false,
          'error': 'Login failed',
        };
      }
    } catch (e) {
      return {
        'messages': 'login failed',
        'error': e.toString(),
      };
    }
  }
}

final loginRepositoryProvider = Provider((ref) => LoginRepository());
