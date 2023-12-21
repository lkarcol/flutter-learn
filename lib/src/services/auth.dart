import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uber/src/api/api.dart';
import 'dart:developer' as developer;
import 'package:uber/src/state/auth.dart';

part 'auth.g.dart';

@riverpod
class AuthService extends _$AuthService {
  @override
  Auth build() {
    return Auth(token: '');
  }

  login(String username, String password) async {
    try {
      final response = await http.post(
        Uri.https(Endpoints.baseURL, '/login'),
        headers: {"content-type": "application/json"},
        body: jsonEncode(<String, String>{
          'username': username,
          'password': password,
        }),
      );

      switch (response.statusCode) {
        case 200:
          final json = jsonDecode(response.body) as Map<String, dynamic>;
          state = Auth.fromJson(json);
          break;
        default:
          throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      developer.log(e.toString());
    }
  }

  resetToken(){
    state.token = '';
  }
}
