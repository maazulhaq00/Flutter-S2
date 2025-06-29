import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:our_app/screens/admin/category/CategoryListScreen.dart';
import 'package:our_app/screens/admin/category/CreateCategoryScreen.dart';
import 'package:our_app/screens/admin/product/CreateProduct.dart';
import 'package:our_app/screens/auth/SignUpScreen.dart';
import 'package:our_app/screens/auth/StartScreen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(DevicePreview(enabled: !kReleaseMode, builder: (context) => MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartScreen(),
    );
  }
}
