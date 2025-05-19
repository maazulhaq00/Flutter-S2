import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final taskController = TextEditingController();

  List<Widget> tasksList = [];

  void addTask() {
    setState(() {
      tasksList.add(Text(taskController.text));
      taskController.text = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Todo App")),
      body: Column(
        children: [
          TextField(
            controller: taskController,
            decoration: InputDecoration(
              labelText: "Enter Task",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          TextButton(onPressed: addTask, child: Text("Add")),

          Column(children: tasksList),
        ],
      ),
    );
  }
}
