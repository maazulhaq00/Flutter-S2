import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  final String useremail;
  const WelcomeScreen({super.key, required this.useremail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Welcome"))),
      body: Center(child: Text("Welcome $useremail")),
    );
  }
}
