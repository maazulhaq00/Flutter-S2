import 'dart:math';

import 'package:flutter/material.dart';

class DiceRow extends StatefulWidget {
  const DiceRow({super.key});

  @override
  State<DiceRow> createState() => _DiceRowState();
}

class _DiceRowState extends State<DiceRow> {
  int leftDiceNumber = 3;
  int rightDiceNumber = 5;

  void handleButtonPress() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });

    print(leftDiceNumber);
    print(rightDiceNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          // flex: 2,
          child: TextButton(
            onPressed: () {
              // print("dice 1 pressed");
              handleButtonPress();
            },
            child: Image.asset('images/dice$leftDiceNumber.png'),
          ),
        ),
        Expanded(
          child: TextButton(
            onPressed: () {
              // print("dice 2 pressed");
              handleButtonPress();
            },
            child: Image.asset('images/dice$rightDiceNumber.png'),
          ),
        ),
        // TextButton(
        //   onPressed: () {
        //     print("Hello");
        //   },
        //   child: Text("CLick"),
        // ),
      ],
    );
  }
}
