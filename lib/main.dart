import 'dart:math';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notification/esewa/esewa_app.dart';
import 'package:notification/facebook/signIn_with_facebook.dart';
import 'package:notification/feature/crashanalytics/crashanalytics.dart';
import 'package:notification/firebase_options.dart';
import 'package:notification/login/login_page.dart';
import 'package:notification/notification/notification_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  print("Error initalizing firebase: $e");
   HandleCrashAnalytics.handleCrashAnalytics();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const NotificationPage(),
      home: SignInWithFacebook(),

//  home: const LoginPage(),
// home: const EsewaApp(title: 'Esewa Login'),
    );
  }
}
