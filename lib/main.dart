import 'package:flutter/material.dart';
import 'package:xbetone/welcome_screen.dart';

void main() {
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
              unselectedLabelColor: Colors.grey.shade600)),
      home: const WelcomeScreen(),
    );
  }
}
