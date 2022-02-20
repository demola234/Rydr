import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rydr/views/Home/home_view.dart';
import 'package:rydr/views/Onboarding/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? isviewed;

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  final prefs = await SharedPreferences.getInstance();
  isviewed = prefs.getInt('onBoard');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Rydr Application',
        debugShowCheckedModeBanner: false,
        home: isviewed != 0 ? 
        Onboarding() : 
        Homeview());
  }
}
