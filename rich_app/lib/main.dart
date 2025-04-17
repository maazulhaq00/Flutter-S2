// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Colors.white54,

      appBar: AppBar(
        title: Center(
            child: Text(
          "Rich App",
          style: TextStyle(color: Colors.white, fontSize: 16),
        )),
        backgroundColor: Colors.black,
        // foregroundColor: Colors.white,
      ),

      // body: Center(child: Text("Hello")),
      // body: Center(
      //   child: Image(
      //     image: NetworkImage(
      //         "https://5.imimg.com/data5/SELLER/Default/2022/4/AK/NB/JO/150673531/diamonds-500x500.jpg"),
      //   ),
      // ),      
      body: Center(
        child: Image(
          image: AssetImage(
              "images/diamond.png"
              ),
        ),
      ),
    ),
  ));
}
