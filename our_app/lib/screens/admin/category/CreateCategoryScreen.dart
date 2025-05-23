import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:our_app/screens/admin/category/CategoryListScreen.dart';
import 'package:our_app/widgets/AdminDrawer.dart';

var db = FirebaseFirestore.instance;

class CreateCategoryScreen extends StatefulWidget {
  const CreateCategoryScreen({super.key});

  @override
  State<CreateCategoryScreen> createState() => _CreateCategoryScreenState();
}

class _CreateCategoryScreenState extends State<CreateCategoryScreen> {
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
        MaterialPageRoute(builder: (context) => CategoryListScreen()),
      );
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      appBar: AppBar(title: Text("Create Category")),
      drawer: AppDrawer(),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: TextField(
                controller: categoryNameController,
                decoration: InputDecoration(labelText: 'Category Name'),
              ),
            ),
            TextButton(onPressed: addCategory, child: Text("Add")),
          ],
        ),
      ),
    );
  }
}
