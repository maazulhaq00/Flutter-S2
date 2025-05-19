import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:our_app/screens/EditCategoryScreen.dart';

var db = FirebaseFirestore.instance;

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  void deleteCategory(docId) async {
    try {
      await db.collection("catgories").doc(docId).delete();

      print("Category deleted");
    } catch (err) {
      print(err);
    }
  }

  void editCategory(category, docId) async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditCategoryScreen(category: category, docId: docId,)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      appBar: AppBar(title: Text("Category List")),
      body: StreamBuilder<QuerySnapshot>(
        stream: db.collection('catgories').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          final categoriesDocs = snapshot.data!.docs;

          // List<Text> categoriesTextList = [];

          // for (var category in categoriesDocs) {
          //   Map<String, dynamic> categoryMap = category.data() as Map<String, dynamic>;

          //   categoriesTextList.add(Text(categoryMap["categoryname"]));
          // }

          // return Column(
          //   children: categoriesTextList,
          // );

          return ListView.builder(
            padding: EdgeInsets.all(10),
            itemCount: categoriesDocs.length,
            itemBuilder: (context, index) {

              Map<String, dynamic> categoryMap = categoriesDocs[index].data() as Map<String, dynamic>;

              String docId = categoriesDocs[index].id;

              return Card(
                child: ListTile(
                  title: Text(categoryMap['categoryname']),
                  // subtitle: Text(categoriesDocs[index].id),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () => deleteCategory(docId),
                        icon: Icon(Icons.delete),
                      ),
                      IconButton(
                        onPressed: () => editCategory(categoryMap, docId),
                        icon: Icon(Icons.edit),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
