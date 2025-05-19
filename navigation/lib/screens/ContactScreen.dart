import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Screen", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Contact Screen"),
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
