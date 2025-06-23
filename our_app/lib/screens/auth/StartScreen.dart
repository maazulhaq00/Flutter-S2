import 'dart:async';

import 'package:flutter/material.dart';
import 'package:our_app/screens/admin/category/CategoryListScreen.dart';
import 'package:our_app/screens/auth/loginScreen.dart';
import 'package:our_app/screens/user/HomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // Timer(Duration(seconds: 3), () {
      SharedPreferences.getInstance()
          .then((pref) {
            bool isLoggedIn = pref.getBool("isLoggedIn") ?? false;

            if (isLoggedIn) {
              if (pref.getString("role") == "user") {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              } else if (pref.getString("role") == "admin") {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => CategoryListScreen()),
                );
              }
            } else {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            }
          })
          .catchError((err) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Welcome")));
  }
}
