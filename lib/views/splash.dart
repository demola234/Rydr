import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:rydr/utils/images_path.dart';
import 'package:rydr/utils/margins.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Onboarding/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int? isviewed;

  Future getAuth() async {
    final prefs = await SharedPreferences.getInstance();
    isviewed = prefs.getInt('onBoarding');
  }

  @override
  void initState() {
    super.initState();
    getAuth();
    Timer(
        Duration(milliseconds: 2500),
        () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return isviewed != 0 ? Onboarding() : Onboarding();
            })));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          FadeIn(
            duration: Duration(milliseconds: 1500),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width: 106,
                height: 33,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(ImagesAsset.splash),
                )),
              ),
            ),
          ),
          Spacer(),
          FadeInUp(
            duration: Duration(milliseconds: 500),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width: 83,
                height: 83,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(ImagesAsset.ripple),
                )),
              ),
            ),
          ),
          YMargin(40)
        ],
      ),
    );
  }
}
