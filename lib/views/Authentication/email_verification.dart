import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydr/utils/margins.dart';
import 'package:rydr/views/Authentication/components/auth_header.dart';
import 'package:rydr/views/Authentication/mobile_auth.dart';
import 'package:rydr/views/Authentication/user_details.dart';
import 'package:rydr/utils/colors.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({Key? key}) : super(key: key);

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  TextEditingController emailtexteditingcontroller = TextEditingController();
  String code = "";
  bool isChange = false;
  bool isValid = false;

  onEmailChange(String email) {
    final numericRegex = RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]");
    setState(() {
      isValid = false;
      if (numericRegex.hasMatch(emailtexteditingcontroller.text))
        isValid = true;
    });
  }

  @override
  void initState() {
    super.initState();
    emailtexteditingcontroller = TextEditingController();
    emailtexteditingcontroller.addListener(() {
      final isChange = emailtexteditingcontroller.text.isNotEmpty;

      setState(() {
        this.isChange = isChange;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    emailtexteditingcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPath.Primarywhite,
      body: SingleChildScrollView(
        child: Column(
          children: [
            YMargin(100),
            authHeader(context),
            FadeInDown(
              duration: Duration(milliseconds: 2000),
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Let’s know you",
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          color: ColorPath.Primarydark,
                          fontSize: 23,
                        ),
                      ),
                      YMargin(10),
                      Text("What is your email address?",
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.normal,
                            color: ColorPath.Primarydark,
                            fontSize: 14,
                          )),
                      YMargin(3.0),
                      Text("Make sure you enter a correct Email Address",
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            color: ColorPath.PrimaryColor,
                            fontSize: 9.0,
                          )),
                    ],
                  ),
                  YMargin(25),
                  CustomTextFieldWidget(
                    onChanged: (password) => onEmailChange(password),
                    controller: emailtexteditingcontroller,
                    keyboardType: TextInputType.emailAddress,
                    autofill: [AutofillHints.email],
                    hintText: 'Enter email address',
                  ),
                  YMargin(30),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Container(
                      height: 50,
                      width: context.screenWidth(),
                      decoration: BoxDecoration(
                        color: isValid && isChange
                            ? ColorPath.Secondarygrey
                            : ColorPath.Primaryfield,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: InkWell(
                        onTap: isValid
                            ? isChange
                                ? () {
                                    setState(() {
                                      isChange = false;
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                UserVerification(),
                                          ));
                                    });
                                  }
                                : null
                            : null,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Next",
                              style: GoogleFonts.poppins(
                                color: ColorPath.Primarywhite,
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
            ),
          ],
        ),
      ),
    );
  }
}
