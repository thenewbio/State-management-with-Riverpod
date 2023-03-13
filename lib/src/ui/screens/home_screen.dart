import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lomj/state/auth/backend/authenticator.dart';

import 'dart:developer' as devtools show log;

import 'package:lomj/state/auth/providers/auth_state_provider.dart';

extension Log on Object {
  void log() => devtools.log(toString());
}

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Main View'),
      ),
      body: Consumer(builder: (context, ref, child) {
        return TextButton(
            onPressed: () async {
              await ref.read(authStateProvider.notifier).logOut();
            },
            child: const Text('Logout'));
      }),
    );
  }
}

class LoginView extends ConsumerWidget {
  const LoginView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginView'),
      ),
      body: Column(
        children: [
          TextButton(
              onPressed: () {
                ref.read(authStateProvider.notifier).loginWithGoogle();
                // final result = await const Authenticator().loginWithGoogle();
                // result.log();
              },
              child: const Text('Sign in with Gooogle')),
          TextButton(
              onPressed: () {
                ref.read(authStateProvider.notifier).loginWithFacebook();
                // final result = await Authenticator().loginWithFacebook();
                // result.log();
              },
              child: const Text('Sign in with Facebook'))
        ],
      ),
    );
  }
}
