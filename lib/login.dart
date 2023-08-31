import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var name = '';
  var avatar = "";
  var phone = "";
  var password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nouveau compte"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 64,
          ),
          TextFormField(
            decoration: const InputDecoration(
                label: Text("Votre phone"),
                prefixIcon: Icon(CupertinoIcons.person),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder()),
            keyboardType: TextInputType.phone,
            onChanged: (newValue) {
              setState(() {
                phone = newValue;
              });
            },
          ),
          SizedBox(
            height: 24,
          ),
          TextFormField(
            decoration: const InputDecoration(
                label: Text("Votre password"),
                prefixIcon: Icon(CupertinoIcons.person),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder()),
            keyboardType: TextInputType.text,
            onChanged: (newValue) {
              setState(() {
                password = newValue;
              });
            },
          ),
          SizedBox(
            height: 164,
          ),
          ElevatedButton(onPressed: () {}, child: Text("Login")),
        ],
      ),
    );
  }
}
