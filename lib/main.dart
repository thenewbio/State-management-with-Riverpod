import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lomj/src/ui/riverpod/example3.dart';
import 'package:lomj/src/ui/riverpod/example4.dart';
import 'package:lomj/src/ui/riverpod/example5.dart';
import 'package:lomj/src/ui/riverpod/example6.dart';
import 'package:lomj/src/ui/riverpod/example2.dart';
import 'package:lomj/src/ui/screens/home_screen.dart';
// import 'package:lomj/src/ui/screens/onboarding_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      title: 'LOM',
      // theme: ThemeData(primarySwatch: Colors.blue),
      // home: const HomeScreen(),
      home: const Example6(),
    );
  }
}
