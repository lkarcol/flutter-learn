import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uber/src/services/auth.dart';
import 'package:uber/src/state/auth.dart';
import 'package:uber/src/views/dashboard.view.dart';
import 'package:uber/src/views/login.view.dart';


class MyApp extends HookConsumerWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

  Auth auth = ref.watch(authServiceProvider);

  return  MaterialApp(
      title: 'Test',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Test'),
        ),
        body: auth.token.isNotEmpty  ? const Dashboard() : const LoginView(),
      ),
    );
  }
}
