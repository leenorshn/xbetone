import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:xbetone/home_screen.dart';
import 'package:xbetone/login.dart';
import 'package:xbetone/signup_screen.dart';
import 'package:xbetone/welcome_screen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        tabBarTheme: TabBarTheme(
            labelColor: Colors.teal,
            unselectedLabelColor: Colors.grey.shade600),
      ),
      home: const RootScreen(),
      routes: {
        "login": (context) => LoginScreen(),
        "sign_up": (context) => SignUpScreen(),
        "root": (context) => RootScreen(),
      },
    );
  }
}

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        initialData: null,
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snap) {
          print(snap);
          if (snap.hasError) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (snap.data != null) {
            return const HomeScreen();
          } else {
            return const WelcomeScreen();
          }
        });
  }
}
