import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lomj/src/ui/riverpod/example3.dart';
import 'package:lomj/src/ui/riverpod/example4.dart';
import 'package:lomj/src/ui/riverpod/example5.dart';
import 'package:lomj/src/ui/riverpod/example6.dart';
import 'package:lomj/src/ui/riverpod/example2.dart';
import 'package:lomj/src/ui/screens/home_screen.dart';
// import 'package:lomj/src/ui/screens/onboarding_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lomj/state/auth/models/auth_result.dart';
import 'package:lomj/state/auth/providers/auth_state_provider.dart';
import 'package:lomj/state/auth/providers/is_logged_in_provider.dart';
import 'package:lomj/views/components/loading/loadingScreen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blueGrey,
          indicatorColor: Colors.blueGrey),
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      title: 'LOM',
      home: Consumer(builder: (context, ref, child) {
        ref.listen<bool>(isLoggedInProvider, (_, isLoading) {
          if (isLoading) {
            LoadingScreen.instance().show(
              context: context,
            );
          } else {
            LoadingScreen.instance().hide();
          }
        });
        final isLoggedIn = ref.watch(isLoggedInProvider);
        isLoggedIn.log();

        if (isLoggedIn) {
          return const MainView();
        } else {
          return const LoginView();
        }
      }),
    );
  }
}
