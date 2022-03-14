import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydr/utils/images_path.dart';
import 'package:rydr/utils/margins.dart';
import 'package:rydr/views/Authentication/forget_password.dart';
import 'package:rydr/views/Authentication/login_screen.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FadeInDown(
        duration: Duration(milliseconds: 2000),
        child: Column(children: [
          YMargin(100),
          Center(
            child: Container(
              alignment: Alignment.center,
              width: 105,
              height: 33,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage(ImagesAsset.logo),
                ),
              ),
            ),
          ),
          YMargin(30),
          Stack(
            children: [
              Container(
                width: context.screenWidth(),
                height: 230,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage(
                          ImagesAsset.authimage1,
                        ))),
              ),
              Positioned(
                top: 80,
                left: context.screenWidth() / 3.5 + 10,
                child: Container(
                  height: 140,
                  width: 140,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(ImagesAsset.useravatar))),
                ),
              ),
              Positioned(
                top: 190,
                left: context.screenWidth() / 2 - 15,
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.camera_alt_rounded,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),
              )
            ],
          ),
          YMargin(15),
          Text("Upload clear image of youself,\nlet’s identify you",
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.normal,
                color: Color(0xFF1F2421),
                fontSize: 14,
              )),
          YMargin(25),
          Text(
            " Set your Home Address and \nfavourite locations",
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w500,
              color: Color(0xFF1F2421),
              fontSize: 23,
            ),
          ),
          YMargin(20),
          favoritecard(
            ImagesAsset.ball,
            "Set your Favoutite Locations",
            "Save more time when booking ride",
          ),
          YMargin(10),
          favoritecard(
            ImagesAsset.house,
            "Set your Home Address",
            "Quick access to your home address",
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForgetPassword(),
                        ));
                  },
                  child: Container(
                    width: 110,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Color(0xFFDCE1DE),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Center(
                      child: Text(
                        "Skip",
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w300,
                          color: Color(0xFF1F2421),
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ));
                  },
                  child: Container(
                    width: 110,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Color(0xFF1F2421),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Center(
                      child: Text(
                        "Proceed",
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w300,
                          color: Color(0xFFFFFFFF),
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ))
        ]),
      ),
    );
  }

  Widget favoritecard(String image, String text1, String text2) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: Color(0xFFDCE1DE),
            border: Border.all(
              width: 0.5,
              color: Color(0xFF878E88),
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 30,
                      width: 30,
                      child:
                          Image(fit: BoxFit.contain, image: AssetImage(image))),
                  XMargin(5.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(text1,
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF1F2421),
                            fontSize: 12,
                          )),
                      Text(text2,
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF878E88),
                            fontSize: 10,
                          )),
                    ],
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 15,
                color: Color(0xFF1F2421),
              ),
            ],
          )),
    );
  }
}
