import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rydr/views/Home/home_view.dart';
import 'package:rydr/views/Onboarding/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

int initScreen = 0;

Future<void> main() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = (prefs.getInt("initScreen"))!;
  await prefs.setInt("initScreen", 1);
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
      initialRoute: initScreen == 0 ? "first" : "/",
      routes: {
        '/': (context) => Homeview(),
        "first": (context) => Onboarding(),
      },
    );
  }
}