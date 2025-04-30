// ignore_for_file: prefer_const_constructors

import 'package:c3_layout/screens/ColumnScreen.dart';
import 'package:c3_layout/screens/SearchScreen.dart';
import 'package:flutter/material.dart';
import 'screens/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ColumnScreen(),
    );
  }
}
