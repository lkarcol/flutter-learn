import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uber/src/providers/me.provider.dart';
import 'package:uber/src/services/user.service.dart';
import 'package:uber/src/state/me.dart';
import 'package:uber/src/views/create-user.view.dart';
import 'package:uber/src/views/user.view.dart';
import 'package:uber/src/views/users.view.dart';

class Dashboard extends HookConsumerWidget {
  const Dashboard({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<Me> me = ref.watch(meProvider);

    ref.watch(userServiceProvider);

    return Center(
      child: switch (me) {
        AsyncData(:final value) => MaterialApp(
            home: DefaultTabController(
              length: 3,
              child: Scaffold(
                appBar: AppBar(
                  bottom: const TabBar(
                    tabs: [
                      Tab(icon: Icon(Icons.list)),
                      Tab(icon: Icon(Icons.settings)),
                      Tab(icon: Icon(Icons.payment)),
                    ],
                  ),
                  title: Text('Welcome ${value.username}'),
                ),
                body: const TabBarView(
                  children: [
                    Users(),
                    CreateUserView(),
                    Center(child: Text('Bohu dušu a mne dukáty'))
                  ],
                ),
              ),
            ),
          ),
        AsyncError() => const Text('Oops, something unexpected happened'),
        _ => const CircularProgressIndicator(),
      },
    );
  }
}
