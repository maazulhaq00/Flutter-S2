import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:our_app/screens/admin/category/CategoryListScreen.dart';
import 'package:our_app/widgets/AdminDrawer.dart';

var db = FirebaseFirestore.instance;

class EditCategoryScreen extends StatefulWidget {
  final Map<String, dynamic> category;
  final String docId;

  const EditCategoryScreen({
    super.key,
    required this.category,
    required this.docId,
  });

  @override
  State<EditCategoryScreen> createState() =>
      _EditCategoryScreenState(category: category, docId: docId);
}

class _EditCategoryScreenState extends State<EditCategoryScreen> {
  final Map<String, dynamic> category;
  final String docId;
  final categoryNameController = TextEditingController();

  void editCategory() async {
    try {
      await db.collection("catgories").doc(docId).update({
        "categoryname": categoryNameController.text,
      });
      print("Updated");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CategoryListScreen()),
      );
    } catch (err) {
      print(err);
    }
  }

  _EditCategoryScreenState({required this.category, required this.docId}) {
    categoryNameController.text = category["categoryname"];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      appBar: AppBar(title: Text("Edit Category")),
      drawer: AppDrawer(),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: TextField(
                controller: categoryNameController,
                decoration: InputDecoration(labelText: 'Category Name'),
              ),
            ),
            TextButton(onPressed: editCategory, child: Text("Update")),
          ],
        ),
      ),
    );
  }
}
