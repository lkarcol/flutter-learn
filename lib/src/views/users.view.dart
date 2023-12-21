import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uber/src/providers/usersList.provider.dart';
import 'package:uber/src/services/auth.dart';
import 'package:uber/src/services/user.service.dart';
import 'package:uber/src/state/user.dart';
import 'package:uber/src/ui/button.dart';
import 'dart:developer' as developer;

import 'package:uber/src/views/user.view.dart';

/// The Widget that configures your application.
class Users extends HookConsumerWidget {
  const Users({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<User>> users = ref.watch(usersListProvider);

    return users.when(
        data: (value) => ListView(
            children: value
                .map((item) => ListTile(
                    onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserView(id: item.id)),
                        ),
                    leading:
                        CircleAvatar(child: Text(item.name.substring(0, 1))),
                    title: Text(item.name)))
                .toList()),
        error: (err, stack) => Text('Error $err'),
        loading: () => const Center(child: CircularProgressIndicator()));
  }
}
