import 'package:flutter/material.dart';
import 'package:navigation/screens/SearchScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // void gotoSearch(BuildContext context) {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => SearchScreen()),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen", style: 
        TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Home Screen"),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchScreen()),
                );
              },
              child: Text("Go to Search Screen"),
            ),
          ],
        ),
      ),
    );
  }
}
