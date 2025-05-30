import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:our_app/widgets/AdminDrawer.dart';

var db = FirebaseFirestore.instance;

class CreateProduct extends StatefulWidget {
  const CreateProduct({super.key});

  @override
  State<CreateProduct> createState() => _CreateProductState();
}

class _CreateProductState extends State<CreateProduct> {
  File? _image;
  final picker = ImagePicker();

  String selectedCategory = "";

  List<DropdownMenuItem> categoryList = [];

  void selectCategory(value) {
    setState(() {
      selectedCategory = value;
    });
  }

  void fetchCategories() async {
    var categorySnapshot = await db.collection("catgories").get();
    var categoryDocs = categorySnapshot.docs;

    for (int i = 0; i < categoryDocs.length; i++) {
      categoryList.add(
        DropdownMenuItem(
          value: categoryDocs[i].id,
          child: Text(categoryDocs[i].data()["categoryname"]),
        ),
      );
    }
  }

  void pickImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      appBar: AppBar(title: Text("Create Product")),
      drawer: AppDrawer(),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            DropdownButtonFormField(
              decoration: InputDecoration(
                labelText: "Select Category",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              items: categoryList,
              onChanged: selectCategory,
            ),
            SizedBox(height: 10),

            Container(
              padding: EdgeInsets.all(10),
              child: _image == null
                ? Text("No Image Selected")
                : Image.network(_image!.path, height: 200),
            ),

            // Text(selectedCategory),
            ElevatedButton(onPressed: pickImage, child: Text("Select Image")),
          ],
        ),
      ),
    );
  }
}
