import 'package:flutter/material.dart';
import 'package:xbetone/home_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 24,
          ),
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(
                height: 64,
              ),
              const Text(
                "Bienvenue sur ",
                style: TextStyle(
                  fontSize: 32,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              const Text.rich(
                TextSpan(
                  text: "X",
                  style: TextStyle(
                    color: Color.fromRGBO(255, 87, 34, 1),
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: "Bet",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              Text(
                "Gagner encore plus",
                style: TextStyle(
                  color: Colors.blueGrey.shade600,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Color.fromARGB(255, 255, 255, 255),
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    minimumSize: Size.fromHeight(40),
                    padding: EdgeInsets.symmetric(vertical: 16)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                },
                child: const Text(
                  "Commencer",
                ),
              ),
              const SizedBox(
                height: 64,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
