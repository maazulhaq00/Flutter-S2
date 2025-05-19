import 'package:flutter/material.dart';
import 'package:todo/screens/WelcomeScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String errorMessage = "";

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() {
    if (emailController.text == "maazulhaq@gmail.com" &&
        passwordController.text == "maaz123") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => 
          WelcomeScreen(useremail: emailController.text),
        ),
      );
    } else {
      setState(() {
        errorMessage = "Incorrect Credentials";
      });
      // print("Incorrect Credentials");
      emailController.text = "";
      passwordController.text = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Login"))),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(errorMessage, style: TextStyle(color: Colors.red)),
            SizedBox(height: 18),

            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 18),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              obscureText: true,
            ),
            SizedBox(height: 18),
            TextButton(onPressed: login, child: Text("Login")),
          ],
        ),
      ),
    );
  }
}
