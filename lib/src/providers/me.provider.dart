import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uber/src/api/api.dart';
import 'package:uber/src/services/auth.dart';
import 'package:uber/src/state/me.dart';

part 'me.provider.g.dart';

@riverpod
FutureOr<Me> me(MeRef ref) async {
  final response = await http.get(Uri.https(Endpoints.baseURL, Me.endpoint,
      {'token': ref.read(authServiceProvider).token}));
  final json = jsonDecode(response.body) as Map<String, dynamic>;

  if (response.statusCode == 401) {
    return ref.read(authServiceProvider.notifier).resetToken();
  }

  return Me.fromJson(json);
}
