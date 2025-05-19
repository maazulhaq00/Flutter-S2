import 'package:flutter/material.dart';
import 'package:todo/screens/HomeScreen.dart';
import 'package:todo/screens/LoginScreen.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}