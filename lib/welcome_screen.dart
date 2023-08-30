import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          // color: Colors.blue,
          width: MediaQuery.of(context).size.width,
          //width: double.infinity,
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
                TextSpan(children: [
                  TextSpan(
                    text: "X",
                    style: TextStyle(
                      color: Color.fromRGBO(255, 87, 34, 1),
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: "Bet",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ]),
              ),
              const Spacer(
                flex: 3,
              ),
              Text(
                "Gagner encore plus",
                style: TextStyle(
                  color: Colors.blueGrey.shade600,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: const Size.fromHeight(40),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "home_screen");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(CupertinoIcons.airplane),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Commencer",
                    ),
                  ],
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
