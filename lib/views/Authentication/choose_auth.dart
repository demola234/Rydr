import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydr/utils/images_path.dart';
import 'package:rydr/utils/margins.dart';
import 'package:rydr/views/Authentication/mobile_auth.dart';

class ChooseAuth extends StatelessWidget {
  const ChooseAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              YMargin(40),
              Center(
                child: Container(
                  alignment: Alignment.center,
                  width: 105,
                  height: 33,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage(ImagesAsset.LOGO),
                    ),
                  ),
                ),
              ),
              YMargin(40),
              Container(
                width: context.screenWidth(),
                height: 160,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage(
                          ImagesAsset.AUTHIMAGE1,
                        ))),
              ),
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
                    icon: ImagesAsset.ENVELOPE,
                    textcolor: Colors.white,
                    bordercolor: Colors.transparent,
                  ),
                  YMargin(10),
                  AuthButtons(
                    color: Colors.white,
                    text: "Continue with Google",
                    icon: ImagesAsset.GOOGLE,
                    textcolor: Color(0xFF212F20),
                    bordercolor: Color(0xFF212F20),
                  ),
                  YMargin(10),
                  AuthButtons(
                    color: Color(0xFF4267B2),
                    text: "Continue with Facebook",
                    icon: ImagesAsset.FACEBOOK,
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
            ])));
  }
}

class AuthButtons extends StatelessWidget {
  Color color;
  String text;
  String icon;
  Color textcolor;
  Function? ontap;
  Color bordercolor;

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
