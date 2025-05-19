import 'package:flutter/material.dart';
import 'package:navigation/screens/ContactScreen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Screen", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Search Screen"),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContactScreen()),
                );
              },
              child: Text("Go to Contact Screen"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Go Back"),
            ),
          ],
        ),
      ),
    );
  }
}
