import 'package:flutter/material.dart';

class CardTile extends StatelessWidget {
  final IconData cardIcon;
  final String cardText;

  const CardTile({super.key, required this.cardIcon, required this.cardText});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 80),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(cardIcon, color: Colors.deepPurple.shade500),
          SizedBox(width: 10),
          Text(cardText,
              style: TextStyle(
                  color: Colors.deepPurple.shade500,
                  fontSize: 20,
                  fontFamily: 'SourceCodePro'))
        ]));
  }
}
