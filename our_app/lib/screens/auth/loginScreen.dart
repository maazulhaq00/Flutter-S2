import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:our_app/screens/admin/category/CategoryListScreen.dart';
import 'package:our_app/screens/auth/SignUpScreen.dart';
import 'package:our_app/screens/user/HomeScreen.dart';

var db = FirebaseFirestore.instance;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() async {
    try {
      final user =
          await db
              .collection("users")
              .where("email", isEqualTo: emailController.text)
              .where("password", isEqualTo: passwordController.text)
              .get();

      final userDocs = user.docs;

      if (userDocs.isEmpty) {
        print("Invalid email or password");
      } else {
        if (userDocs[0]["role"] == "user") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        } else if (userDocs[0]["role"] == "admin") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CategoryListScreen()),
          );
        }
      }
    } catch (e) {
      print(e);
    }
  }
  void navigateToSignUp() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpScreen()),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                obscureText: true,
              ),
            ),
            OutlinedButton(onPressed: login, child: Text("Login")),
            TextButton(
              onPressed: navigateToSignUp,
              child: Text("Donot Have an account? Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}
