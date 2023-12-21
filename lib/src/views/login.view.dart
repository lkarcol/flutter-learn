import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uber/src/services/auth.dart';
import 'package:uber/src/ui/button.dart';
import 'dart:developer' as developer;

/// The Widget that configures your application.
class LoginView extends HookConsumerWidget {
  const LoginView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usernameController = useTextEditingController(text: '');
    final passwordController = useTextEditingController(text: '');

    signIn() {
      developer.log('log me');
      ref.read(authServiceProvider.notifier).login(usernameController.text, passwordController.text);
    }

    return Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter username',
              ),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter password',
              ),
            ),
            Button(label: 'Sign in', onTap: signIn)
          ],
        ));
  }
}
