// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyACPt1c5In7mOxnrRKqI7o-4Fo-8MLw1kg',
    appId: '1:378173437960:web:541cc7d35799fcf62ff9bd',
    messagingSenderId: '378173437960',
    projectId: 'lovers-of-mary-and-jesus',
    authDomain: 'lovers-of-mary-and-jesus.firebaseapp.com',
    storageBucket: 'lovers-of-mary-and-jesus.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA9cQ81Z3bPpgUhfBAZoDiTnUAJweWpMJc',
    appId: '1:378173437960:android:37a0c51a4cbc691d2ff9bd',
    messagingSenderId: '378173437960',
    projectId: 'lovers-of-mary-and-jesus',
    storageBucket: 'lovers-of-mary-and-jesus.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCY4neeKuS-yPeyWqfutRjkhR5EUOussDc',
    appId: '1:378173437960:ios:eff4af35ccf30a572ff9bd',
    messagingSenderId: '378173437960',
    projectId: 'lovers-of-mary-and-jesus',
    storageBucket: 'lovers-of-mary-and-jesus.appspot.com',
    iosClientId: '378173437960-kku3o76qvglmphldnddol3r2uki0id26.apps.googleusercontent.com',
    iosBundleId: 'com.example.lomj',
  );
}
