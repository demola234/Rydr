import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydr/utils/margins.dart';
import 'package:rydr/views/Authentication/create_password.dart';
import 'package:rydr/views/Authentication/mobile_auth.dart';
import 'package:rydr/utils/colors.dart';
import 'components/auth_header.dart';

class UserVerification extends StatefulWidget {
  const UserVerification({Key? key}) : super(key: key);

  @override
  State<UserVerification> createState() => _UserVerificationState();
}

class _UserVerificationState extends State<UserVerification> {
  TextEditingController firstnametexteditingcontroller =
      TextEditingController();
  TextEditingController lastnametexteditingcontroller = TextEditingController();
  String code = "";
  bool isChange = false;

  @override
  void initState() {
    super.initState();
    firstnametexteditingcontroller = TextEditingController();
    lastnametexteditingcontroller = TextEditingController();

    lastnametexteditingcontroller.addListener(() {
      final isChange = lastnametexteditingcontroller.text.isNotEmpty &&
          lastnametexteditingcontroller.text.isNotEmpty;
      setState(() {
        this.isChange = isChange;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    lastnametexteditingcontroller.dispose();
    firstnametexteditingcontroller.dispose();
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
                child: Column(children: [
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
                      Text("Please enter your correct names for identification",
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.normal,
                            color: ColorPath.Primarydark,
                            fontSize: 14,
                          )),
                    ],
                  ),
                  YMargin(25),
                  CustomTextFieldWidget(
                    controller: firstnametexteditingcontroller,
                    keyboardType: TextInputType.name,
                    autofill: [AutofillHints.name],
                    hintText: 'First name',
                  ),
                  YMargin(10),
                  CustomTextFieldWidget(
                    controller: lastnametexteditingcontroller,
                    keyboardType: TextInputType.name,
                    autofill: [AutofillHints.name],
                    hintText: 'Last name',
                  ),
                  YMargin(30),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Container(
                      height: 50,
                      width: context.screenWidth(),
                      decoration: BoxDecoration(
                        color: isChange
                            ? ColorPath.Secondarygrey
                            : ColorPath.Primaryfield,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: InkWell(
                        onTap: isChange
                            ? () {
                                setState(() {
                                  isChange = false;
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            PasswordVerification(),
                                      ));
                                });
                              }
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
                ])),
          ],
        ),
      ),
    );
  }
}
