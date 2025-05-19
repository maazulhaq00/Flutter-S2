import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:our_app/screens/CategoryListScreen.dart';

var db = FirebaseFirestore.instance;

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final categoryNameController = TextEditingController();

  void addCategory() async {
    try {
      await db.collection('catgories').add({
        "categoryname": categoryNameController.text,
      });

      print("Category added");

      categoryNameController.text = "";

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => 
        CategoryListScreen()),
      );
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      appBar: AppBar(title: Text("Category")),
      body: Column(
        children: [
          TextField(
            controller: categoryNameController,
            decoration: InputDecoration(labelText: 'Category Name'),
          ),
          TextButton(onPressed: addCategory, child: Text("Add")),
        ],
      ),
    );
  }
}
