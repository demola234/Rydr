import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydr/utils/images_path.dart';
import 'package:rydr/utils/margins.dart';
import 'package:rydr/views/Authentication/components/auth_header.dart';
import 'package:rydr/views/Authentication/mobile_auth.dart';

class ChooseAuth extends StatelessWidget {
  const ChooseAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: FadeInDown(
          duration: Duration(milliseconds: 3000),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                YMargin(40),
                authHeader(context),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Enjoy a new car \nhailing experience",
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1F2421),
                          fontSize: 26,
                        ),
                      ),
                      YMargin(5.0),
                      Text(
                        "Amazing Experience with top notch \ncab services",
                        style: GoogleFonts.montserrat(
                          color: Color(0xFF878E88),
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                YMargin(40),
                Column(
                  children: [
                    AuthButtons(
                      color: Color(0xFF1F2421),
                      text: "Continue with Email",
                      icon: ImagesAsset.envelope,
                      textcolor: Colors.white,
                      bordercolor: Colors.transparent,
                    ),
                    YMargin(10),
                    AuthButtons(
                      color: Colors.white,
                      text: "Continue with Google",
                      icon: ImagesAsset.google,
                      textcolor: Color(0xFF212F20),
                      bordercolor: Color(0xFF212F20),
                    ),
                    YMargin(10),
                    AuthButtons(
                      color: Color(0xFF4267B2),
                      text: "Continue with Facebook",
                      icon: ImagesAsset.facebookb,
                      textcolor: Color(0xFFFFFFFF),
                      bordercolor: Colors.transparent,
                    )
                  ],
                ),
                YMargin(45),
                Container(
                  alignment: Alignment.center,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "By continuing, you are acknowledging \nour ",
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            color: Color(0xFF878E88),
                          ),
                        ),
                        TextSpan(
                            text: "terms ",
                            style: GoogleFonts.montserrat(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline)),
                        TextSpan(
                          text: "and ",
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                            color: Color(0xFF878E88),
                          ),
                        ),
                        TextSpan(
                            text: "privacy policy",
                            style: GoogleFonts.montserrat(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline)),
                      ],
                    ),
                  ),
                ),
                YMargin(40),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Have an account?",
                          style: GoogleFonts.montserrat(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                          )),
                      XMargin(5.0),
                      InkWell(
                        child: Text("Sign in",
                            style: GoogleFonts.montserrat(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            )),
                      )
                    ],
                  ),
                )
              ]),
        )));
  }
}

// ignore: must_be_immutable
class AuthButtons extends StatelessWidget {
  final Color color;
  final String text;
  final String icon;
  final Color textcolor;
  Function? ontap;
  final Color bordercolor;

  AuthButtons({
    required this.color,
    required this.text,
    required this.icon,
    required this.textcolor,
    required this.bordercolor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Container(
        height: 50,
        width: context.screenWidth(),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: bordercolor,
            )),
        child: InkWell(
          onTap: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => MobileAuth()));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: GoogleFonts.poppins(
                  color: textcolor,
                  fontWeight: FontWeight.w400,
                ),
              ),
              XMargin(7.0),
              SvgPicture.asset(icon),
            ],
          ),
        ),
      ),
    );
  }
}
