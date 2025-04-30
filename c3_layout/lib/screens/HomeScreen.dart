// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey.shade300,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "My App",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            // 1st container
            Container(
              color: Colors.amber,
              child: Text("Home"),
              // width: 200,
              // height: 200,
              // padding: EdgeInsets.only(top: 10, left: 30),
              // padding: EdgeInsets.fromLTRB(10, 20, 30, 40),
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              margin: EdgeInsets.all(20),
            ),
            // 2nd container
            Container(
              color: Colors.red,
              child: Text("Screen"),
              // width: 200,
              // height: 200,
              // padding: EdgeInsets.only(top: 10, left: 30),
              // padding: EdgeInsets.fromLTRB(10, 20, 30, 40),
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              margin: EdgeInsets.all(20),
            ),
          ],
        ));
  }
}
