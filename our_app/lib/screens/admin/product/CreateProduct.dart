import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:our_app/widgets/AdminDrawer.dart';
import 'package:http/http.dart' as http;

var db = FirebaseFirestore.instance;

class CreateProduct extends StatefulWidget {
  const CreateProduct({super.key});

  @override
  State<CreateProduct> createState() => _CreateProductState();
}

class _CreateProductState extends State<CreateProduct> {
  XFile? _image;
  final picker = ImagePicker();

  final productNameController = TextEditingController();
  final productPriceController = TextEditingController();

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
        _image = pickedImage;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchCategories();
  }

  Future<String?> uploadImageToCloudinary(XFile image) async {
    const cloudName = "djk3nb4nk";
    const uploadPreset = "ourapp";

    final url = Uri.parse(
      "https://api.cloudinary.com/v1_1/$cloudName/image/upload",
    );

    final bytes = await image.readAsBytes();

    final request =
        http.MultipartRequest("POST", url)
          ..fields['upload_preset'] = uploadPreset
          ..files.add(
            http.MultipartFile.fromBytes('file', bytes, filename: image.name),
          );

    final response = await request.send();

    if (response.statusCode == 200) {
      final resStr = await response.stream.bytesToString();
      final jsonData = json.decode(resStr);
      print(jsonData['secure_url']);
      return jsonData['secure_url'];
    } else {
      print("Image upload failed");
      return null;
    }
  }

  void addProduct() async {
    if (productPriceController.text != null &&
        selectedCategory != "" &&
        _image != null) {
      // product add to firebase

      String? imageUrl = await uploadImageToCloudinary(_image!);

      if (imageUrl != null) {
        await db.collection("products").add({
          "productname": productNameController.text,
          "productprice": productPriceController.text,
          "productcategory": selectedCategory,
          "imageUrl": imageUrl,
        });
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Product Added")));
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Image not selected properly")));
      }
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Feilds not filled")));
    }
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
            TextField(
              decoration: InputDecoration(
                labelText: "Product Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              controller: productNameController,
            ),
            SizedBox(height: 10),

            TextField(
              decoration: InputDecoration(
                labelText: "Product Price",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              controller: productPriceController,
            ),
            SizedBox(height: 10),

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
              child:
                  _image == null
                      ? Text("No Image Selected")
                      : Image.network(_image!.path, height: 200),
            ),
            SizedBox(height: 10),

            // Text(selectedCategory),
            ElevatedButton(
              onPressed: pickImage,
              child: Text("Select Product Image"),
            ),
            SizedBox(height: 10),

            ElevatedButton(
              onPressed: () async {
                addProduct();
              },
              child: Text("Add Product"),
            ),
          ],
        ),
      ),
    );
  }
}
