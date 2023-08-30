import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:xbetone/home_screen.dart';
import 'package:xbetone/welcome_screen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
      initialRoute: "/",
      routes: {
        "/": (context) => const WelcomeScreen(),
        "home_screen": (context) => const HomeScreen(),
      },

      //home: const WelcomeScreen(),
    );
  }
}
