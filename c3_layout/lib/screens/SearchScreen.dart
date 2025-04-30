// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Search Screen",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(child: Text("This is Search Screen"),),
    );
  }
}
