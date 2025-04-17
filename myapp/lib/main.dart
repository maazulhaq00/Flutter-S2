// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

// void main() {
//   runApp(
//     MaterialApp(
//       home: Center(
//         child: Text(
//             "Hello World",
//           ),
//       ),
//     ),
//   );
// }

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text(
          "My First Application",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
      ),
    ),
  ));
}
