import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uber/src/providers/userProfile.provider.dart';
import 'package:uber/src/state/user.dart';
import 'package:uber/src/ui/button.dart';

/// The Widget that configures your application.
class UserView extends HookConsumerWidget {
  const UserView({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<User> user = ref.watch(userProfileProvider(id));

    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: user.when(
                data: (data) => Column(children: [
                      Center(
                        child: Button(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          label: 'Go back!',
                        ),
                      ),
                      Text(
                        data.id,
                      ),
                      Text(data.name),
                      Text(data.email)
                    ]),
                error: (err, stack) => Text('Error $err'),
                loading: () =>
                    const Center(child: CircularProgressIndicator()))));
  }
}
