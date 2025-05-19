import 'dart:math';

import 'package:dice_app/widgets/DiceRow.dart';
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
        child: DiceRow(),
      ),
    );
  }
}
