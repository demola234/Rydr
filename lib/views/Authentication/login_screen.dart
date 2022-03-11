import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydr/core/services/local_auth.dart';
import 'package:rydr/utils/images_path.dart';
import 'package:rydr/utils/margins.dart';
import 'package:rydr/views/Authentication/mobile_auth.dart';
import 'package:rydr/views/Home/home_view.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailnametexteditingcontroller =
      TextEditingController();
  TextEditingController passwordnametexteditingcontroller =
      TextEditingController();
  String code = "";
  bool isChange = false;

  @override
  void initState() {
    super.initState();
    emailnametexteditingcontroller = TextEditingController();
    passwordnametexteditingcontroller = TextEditingController();

    passwordnametexteditingcontroller.addListener(() {
      final isChange = passwordnametexteditingcontroller.text.isNotEmpty &&
          passwordnametexteditingcontroller.text.isNotEmpty;
      setState(() {
        this.isChange = isChange;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    passwordnametexteditingcontroller.dispose();
    emailnametexteditingcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(children: [
          YMargin(100),
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
          YMargin(30),
          Container(
            width: context.screenWidth(),
            height: 160,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      ImagesAsset.AUTHIMAGE2,
                    ))),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome Back To Rydr",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF1F2421),
                        fontSize: 18,
                      ),
                    ),
                    YMargin(7),
                    Text("Enjoy awesome rides at cheap rates",
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w300,
                          color: Color(0xFF1F2421),
                          fontSize: 12,
                        )),
                  ],
                ),
              ),
              YMargin(30),
              CustomTextFieldWidget(
                controller: emailnametexteditingcontroller,
                keyboardType: TextInputType.emailAddress,
                autofill: [AutofillHints.email],
                hintText: 'Email Address',
              ),
              YMargin(10),
              CustomTextFieldWidget(
                controller: passwordnametexteditingcontroller,
                keyboardType: TextInputType.visiblePassword,
                hideText: true,
                suffixWidget: Text("show"),
                autofill: [AutofillHints.password],
                hintText: 'Password',
              ),
              YMargin(20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  height: 50,
                  width: context.screenWidth(),
                  decoration: BoxDecoration(
                    color: isChange ? Color(0XFF1F2421) : Color(0xFFDCE1DE),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: InkWell(
                    onTap: isChange
                        ? () {
                            setState(() {
                              isChange = false;
                              // Navigator.pushReplacement(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) => (),
                              //     ));
                            });
                          }
                        : null,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Login",
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          YMargin(40),
          Row(children: [
            Padding(
              padding: EdgeInsets.only(left: 30),
              child: Container(
                height: 50,
                width: context.screenWidth() - 180,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: Color(0xFF90D8FF),
                    )),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Homeview()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Continue with Google",
                          style: GoogleFonts.poppins(
                            color: Color(0xFF212F20),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        XMargin(7.0),
                        SvgPicture.asset(ImagesAsset.GOOGLE),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            XMargin(8),
            InkWell(
              onTap: () {},
              child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Color(0xFF4267B2),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  height: 50,
                  width: 50,
                  child: SvgPicture.asset(ImagesAsset.FACEBOOK,
                      height: 14, width: 9)),
            ),
            XMargin(8),
            InkWell(
              onTap: () async {
                final isAuthenticated = await LocalAuthApi.authenticate();

                if (isAuthenticated) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Homeview()),
                  );
                }
              },
              child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Color(0xFF878E88),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  height: 50,
                  width: 50,
                  child: SvgPicture.asset(
                    !Platform.isIOS ? ImagesAsset.finger : ImagesAsset.faceid,
                    height: 14,
                    width: 9,
                  )),
            ),
          ]),
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
                  child: Text("Sign up",
                      style: GoogleFonts.montserrat(
                        fontSize: 13,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      )),
                )
              ],
            ),
          )
        ]));
  }

  Widget buildText(String text, bool checked) => Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            checked
                ? Icon(Icons.check, color: Colors.green, size: 24)
                : Icon(Icons.close, color: Colors.red, size: 24),
            const SizedBox(width: 12),
            Text(text, style: TextStyle(fontSize: 24)),
          ],
        ),
      );

  Widget buildAuthenticate(BuildContext context) => buildButton(
        text: 'Authenticate',
        icon: Icons.lock_open,
        onClicked: () async {
          final isAuthenticated = await LocalAuthApi.authenticate();

          if (isAuthenticated) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => Homeview()),
            );
          }
        },
      );

  Widget buildButton({
    required String text,
    required IconData icon,
    required VoidCallback onClicked,
  }) =>
      ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(50),
        ),
        icon: Icon(icon, size: 26),
        label: Text(
          text,
          style: TextStyle(fontSize: 20),
        ),
        onPressed: onClicked,
      );
}
