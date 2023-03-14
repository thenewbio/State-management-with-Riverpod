import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lomj/state/auth/backend/authenticator.dart';

import 'dart:developer' as devtools show log;

import 'package:lomj/state/auth/providers/auth_state_provider.dart';
import 'package:lomj/views/components/dialogs/alert_dialog_model.dart';
import 'package:lomj/views/components/dialogs/logout_dialog.dart';
import 'package:lomj/views/components/loading/loadingScreen.dart';
import 'package:lomj/views/constants/strings.dart';
import 'package:lomj/views/tabs/users_posts_user_post_view.dart';

extension Log on Object {
  void log() => devtools.log(toString());
}

class MainView extends ConsumerStatefulWidget {
  const MainView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainViewState();
}

class _MainViewState extends ConsumerState<MainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(Strings.appName),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const FaIcon(FontAwesomeIcons.film),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add_photo_alternate_outlined),
            ),
            IconButton(
              onPressed: () async {
                final shouldLogout = await const LogoutDialog()
                    .present(context)
                    .then((value) => value ?? false);

                if (shouldLogout) {
                  await ref.read(authStateProvider.notifier).logOut();
                }
              },
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        body: const UserPostView()
        // Consumer(builder: (context, ref, child) {
        //   return TextButton(
        //       onPressed: () async {
        //         // LoadingScreen.instance()
        //         //     .show(context: context, text: "Loading...");
        //         await ref.read(authStateProvider.notifier).logOut();
        //       },
        //       child: const Text('Logout'));
        // }),
        );
  }
}
