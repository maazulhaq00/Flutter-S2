import 'package:flutter/material.dart';
import 'package:our_app/screens/admin/category/CategoryListScreen.dart';
import 'package:our_app/screens/admin/category/CreateCategoryScreen.dart';
import 'package:our_app/screens/admin/product/CreateProduct.dart';
import 'package:our_app/screens/admin/product/ProductListScreen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text("Admin"),
          ),
          ListTile(
            title: Text("Create Category"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreateCategoryScreen()),
              );
            },
          ),
          ListTile(
            title: Text("Display Categories"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CategoryListScreen()),
              );
            },
          ),
          ListTile(
            title: Text("Create Product"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CreateProduct()),
              );
            },
          ),
          ListTile(
            title: Text("Display Products"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductListScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
