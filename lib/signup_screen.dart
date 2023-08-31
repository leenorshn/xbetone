import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xbetone/apis/auth_api.dart';

import 'models/user.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var name = '';
  var avatar = "";
  var phone = "";
  var password = "";
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nouveau compte"),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: 64,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    label: Text("Votre nom"),
                    prefixIcon: Icon(CupertinoIcons.person),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder()),
                onChanged: (newValue) {
                  setState(() {
                    name = newValue;
                  });
                },
              ),
              SizedBox(
                height: 24,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    label: Text("Votre phone"),
                    prefixIcon: Icon(CupertinoIcons.phone),
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
                    label: Text("Votre avatar en URL"),
                    prefixIcon: Icon(CupertinoIcons.link),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder()),
                onChanged: (newValue) {
                  setState(() {
                    avatar = newValue;
                  });
                },
              ),
              SizedBox(
                height: 24,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    label: Text("Votre password"),
                    prefixIcon: Icon(CupertinoIcons.lock),
                    border: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder()),
                obscureText: true,
                obscuringCharacter: "#",
                keyboardType: TextInputType.text,
                onChanged: (newValue) {
                  setState(() {
                    password = newValue;
                  });
                },
              ),
              const SizedBox(
                height: 164,
              ),
              isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () async {
                        var user =
                            User(name: name, avatar: avatar, phone: phone);
                        setState(() {
                          isLoading = true;
                        });
                        await AuthApi().signUp(user, password).then((value) {
                          Navigator.pushNamedAndRemoveUntil(
                              context, "root", (route) => false);
                        });

                        setState(() {
                          isLoading = false;
                        });
                      },
                      child: const Text("Creer compte"),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
