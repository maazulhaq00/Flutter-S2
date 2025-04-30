import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent,
        title: Text("Dice App"),
      ),
      body: Center(
        child: Row(
          children: [
            Expanded(
              // flex: 2,
              child: Image.asset('images/dice1.png')),
            Expanded(child: Image.asset('images/dice2.png'))
            
          ],
        ),
      ),

    );
  }
}