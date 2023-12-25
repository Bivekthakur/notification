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
        return macos;
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
    apiKey: 'AIzaSyCT6wSeMiCgvSaJ48ehDDPlJnVxAWgoSUE',
    appId: '1:955466677534:web:066bad6363bc8763d71d0f',
    messagingSenderId: '955466677534',
    projectId: 'notification-8c482',
    authDomain: 'notification-8c482.firebaseapp.com',
    storageBucket: 'notification-8c482.appspot.com',
    measurementId: 'G-8JYGDZGP15',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDXjXSBcg6rc3YJlkfOP-NaYkTx2r8wMKU',
    appId: '1:955466677534:android:48997b9cdb11e23ed71d0f',
    messagingSenderId: '955466677534',
    projectId: 'notification-8c482',
    storageBucket: 'notification-8c482.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDZ--EapdQ0HiReDT2Dakn5Jm-elMd0Dsg',
    appId: '1:955466677534:ios:66f3d266003b7769d71d0f',
    messagingSenderId: '955466677534',
    projectId: 'notification-8c482',
    storageBucket: 'notification-8c482.appspot.com',
    iosBundleId: 'com.broadwayinfosys.notification',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDZ--EapdQ0HiReDT2Dakn5Jm-elMd0Dsg',
    appId: '1:955466677534:ios:3f83f41c1203de30d71d0f',
    messagingSenderId: '955466677534',
    projectId: 'notification-8c482',
    storageBucket: 'notification-8c482.appspot.com',
    iosBundleId: 'com.broadwayinfosys.notification.RunnerTests',
  );
}
