import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uber/src/api/api.dart';
import 'dart:developer' as developer;
import 'package:uber/src/state/user.dart';

part 'user.service.g.dart';

@riverpod
class UserService extends _$UserService {
  @override
  List<User> build() {
    return [];
  }

  Future<List<User>> getUsers() async {
    if (state.isNotEmpty) {
      return state;
    }

    final response =
        await http.get(Uri.https(Endpoints.baseURL, User.endpoint));
    final json = (jsonDecode(response.body) as List)
        .cast<Map<String, Object?>>()
        .map(User.fromJson)
        .toList();

    state = json;

    return json;
  }

  Future<User> getUser(String id) async {
    final response =
        await http.get(Uri.https(Endpoints.baseURL, '${User.endpoint}/${id}'));
    final json = jsonDecode(response.body) as Map<String, dynamic>;

    return User.fromJson(json);
  }

  Future<User> createUser(String name, String email) async {
    final response = await http.put(
      Uri.https(Endpoints.baseURL, '${User.endpoint}/create'),
      headers: {"content-type": "application/json"},
      body: jsonEncode(<String, String>{
        'name': name,
        'email': email,
      }),
    );
    final json = jsonDecode(response.body) as Map<String, dynamic>;

    User user = User.fromJson(json);
    state = [...state, user];

    return user;
  }
}
