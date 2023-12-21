import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uber/src/services/user.service.dart';
import 'package:uber/src/state/user.dart';

part 'usersList.provider.g.dart';

@riverpod
FutureOr<List<User>> usersList(Ref ref) async {
  return await ref.read(userServiceProvider.notifier).getUsers();
}
