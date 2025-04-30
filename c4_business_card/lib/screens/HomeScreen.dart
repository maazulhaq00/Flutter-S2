// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:c4_business_card/widgets/CardTile.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade200,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage("images/profile.jpg"),
            radius: 50,
          ),
          Text(
            "Hamza Qureshi",
            style: TextStyle(
              color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold, fontFamily: 'Pacifico'
              ),
          ),
          Text(
            "Software Engineer",
            style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 2, 
              fontFamily: 'SourceCodePro'
              ),
          ),
          SizedBox(
            height: 65,
            width: 100,
            child: Divider(color: Colors.deepPurple,),
          ),
          CardTile(cardIcon: Icons.phone, cardText: '+92 312 1234567'),
          CardTile(cardIcon: Icons.mail, cardText: 'hamza@gmail.com'),
          CardTile(cardIcon: Icons.location_city, cardText: 'Karachi, Pakistan'),


        ],
      ),
    );
  }
}