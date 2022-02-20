import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rydr/Views/Home/HomeView.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rydr Application',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Homeview()),
    );
  }
}
