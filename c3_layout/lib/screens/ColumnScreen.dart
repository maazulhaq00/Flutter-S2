import 'package:flutter/material.dart';

class ColumnScreen extends StatelessWidget {
  const ColumnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan.shade50,
      appBar: AppBar(
        title: Text("Columns Screen"),
        backgroundColor: Colors.cyan,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: (MediaQuery.of(context).size.height - 60) / 3,
            child: Center(
                child: Text(
              "Container 01",
              style: TextStyle(color: Colors.white),
            )),
            color: Colors.red,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: (MediaQuery.of(context).size.height - 60) / 3,
            child: Center(
                child: Text(
              "Container 02",
              style: TextStyle(color: Colors.white),
            )),
            color: Colors.green,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: (MediaQuery.of(context).size.height - 60) / 3,
            child: Center(
                child: Text(
              "Container 03",
              style: TextStyle(color: Colors.white),
            )),
            color: Colors.blue,
          ),
          Container(
            width: double.infinity,
          )
        ],
      ),
    );
  }
}
