import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uber/src/services/user.service.dart';
import 'package:uber/src/state/user.dart';

part 'userProfile.provider.g.dart';

@riverpod
FutureOr<User> userProfile(Ref ref, String id) async {
  return await ref.read(userServiceProvider.notifier).getUser(id);
}
