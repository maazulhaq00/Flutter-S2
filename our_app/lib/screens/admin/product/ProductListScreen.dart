import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:our_app/widgets/AdminDrawer.dart';

var db = FirebaseFirestore.instance;

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  // void deleteCategory(docId) async {
  //   try {
  //     await db.collection("catgories").doc(docId).delete();

  //     print("Category deleted");
  //   } catch (err) {
  //     print(err);
  //   }
  // }

  // void editCategory(category, docId) async {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder:
  //           (context) => EditCategoryScreen(category: category, docId: docId),
  //     ),
  //   );
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      appBar: AppBar(title: Text("Category List")),
      drawer: AppDrawer(),
      body: StreamBuilder<QuerySnapshot>(
        stream: db.collection('products').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          final productsDocs = snapshot.data!.docs;

          return ListView.builder(
            padding: EdgeInsets.all(10),
            itemCount: productsDocs.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> productMap =
                  productsDocs[index].data() as Map<String, dynamic>;

              String docId = productsDocs[index].id;

              return FutureBuilder(
                future:
                    db
                        .collection("catgories")
                        .doc(productMap['productcategory'])
                        .get(),
                builder: (context, catSnapShot) {
                  String categoryName = "Loading ... ";

                  if (catSnapShot.hasData) {
                    var categoryDocs = catSnapShot.data;
                    var categoryMap = categoryDocs!.data();
                    categoryName = categoryMap!['categoryname'];
                  }

                  return Card(
                    child: ListTile(
                      leading: Image.network(productMap['imageUrl']),
                      title: Text(productMap['productname']),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Rs. ${productMap['productprice']}"),
                          Text(categoryName),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () => {},
                            icon: Icon(Icons.delete, color: Colors.red),
                          ),
                          IconButton(
                            onPressed: () => {},
                            icon: Icon(Icons.edit, color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
