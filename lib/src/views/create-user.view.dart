import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uber/src/services/auth.dart';
import 'package:uber/src/services/user.service.dart';
import 'package:uber/src/ui/button.dart';
import 'dart:developer' as developer;

class CreateUserView extends HookConsumerWidget {
  const CreateUserView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nameController = useTextEditingController(text: '');
    final emailController = useTextEditingController(text: '');

    createUser() {
      ref
          .read(userServiceProvider.notifier)
          .createUser(nameController.text, emailController.text).whenComplete(() => DefaultTabController.of(context).animateTo(0));
    }

    return Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Name',
              ),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Email',
              ),
            ),
            Button(label: 'Create User', onTap: createUser)
          ],
        );
  }
}
