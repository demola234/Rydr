import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydr/utils/margins.dart';
import 'package:rydr/views/Authentication/components/auth_header.dart';
import 'package:rydr/views/Authentication/mobile_auth.dart';
import 'package:rydr/views/Authentication/user_info.dart';
import 'package:rydr/utils/colors.dart';

class PasswordVerification extends StatefulWidget {
  const PasswordVerification({Key? key}) : super(key: key);

  @override
  State<PasswordVerification> createState() => _PasswordVerificationState();
}

class _PasswordVerificationState extends State<PasswordVerification> {
  TextEditingController passwordtexteditingcontroller = TextEditingController();
  String code = "";
  bool isChange = false;
  bool isPasswordEightCharacters = false;
  bool hasPasswordOneNumber = false;

  onPasswordChanged(String password) {
    final numericRegex = RegExp(r'[0-9]');

    setState(() {
      isPasswordEightCharacters = false;
      if (passwordtexteditingcontroller.text.length >= 8)
        isPasswordEightCharacters = true;

      hasPasswordOneNumber = false;
      if (numericRegex.hasMatch(passwordtexteditingcontroller.text))
        hasPasswordOneNumber = true;
    });
  }

  @override
  void initState() {
    super.initState();
    passwordtexteditingcontroller = TextEditingController();
    passwordtexteditingcontroller.addListener(() {
      final isChange = passwordtexteditingcontroller.text.isNotEmpty;

      setState(() {
        this.isChange = isChange;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    passwordtexteditingcontroller.dispose();
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
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Secure your account",
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          color: ColorPath.Primarydark,
                          fontSize: 23,
                        ),
                      ),
                      YMargin(15),
                      Text("Create your password",
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.normal,
                            color: ColorPath.Primarydark,
                            fontSize: 14,
                          )),
                    ],
                  ),
                  YMargin(35),
                  CustomTextFieldWidget(
                    onChanged: (password) => onPasswordChanged(password),
                    controller: passwordtexteditingcontroller,
                    hideText: true,
                    keyboardType: TextInputType.visiblePassword,
                    autofill: [AutofillHints.password],
                    hintText: 'Create password',
                  ),
                  YMargin(10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Row(
                      children: [
                        AnimatedContainer(
                            duration: Duration(milliseconds: 200),
                            decoration: BoxDecoration(),
                            child: Row(
                              children: [
                                Icon(
                                  isPasswordEightCharacters
                                      ? Icons.check
                                      : Icons.cancel_outlined,
                                  color: isPasswordEightCharacters
                                      ? ColorPath.Primarygreen
                                      : ColorPath.Primaryred,
                                  size: 10.0,
                                ),
                                XMargin(2),
                                Text(
                                  "8 characters long",
                                  style: GoogleFonts.poppins(
                                    color: isPasswordEightCharacters
                                        ? ColorPath.Primarygreen
                                        : ColorPath.Primaryred,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 9.0,
                                  ),
                                )
                              ],
                            )),
                        XMargin(10),
                        AnimatedContainer(
                            duration: Duration(milliseconds: 200),
                            decoration: BoxDecoration(),
                            child: Row(
                              children: [
                                Icon(
                                  hasPasswordOneNumber
                                      ? Icons.check
                                      : Icons.cancel_outlined,
                                  color: hasPasswordOneNumber
                                      ? Colors.green
                                      : Colors.red,
                                  size: 10.0,
                                ),
                                XMargin(2),
                                Text(
                                  "Must contain Number",
                                  style: GoogleFonts.poppins(
                                    color: hasPasswordOneNumber
                                        ? ColorPath.Primarygreen
                                        : ColorPath.Primaryred,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 9.0,
                                  ),
                                )
                              ],
                            ))
                      ],
                    ),
                  ),
                  YMargin(20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Container(
                      height: 50,
                      width: context.screenWidth(),
                      decoration: BoxDecoration(
                        color: isPasswordEightCharacters &&
                                hasPasswordOneNumber &&
                                isChange
                            ? ColorPath.Secondarygrey
                            : ColorPath.Primaryfield,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: InkWell(
                        onTap: isPasswordEightCharacters && hasPasswordOneNumber
                            ? isChange
                                ? () {
                                    setState(() {
                                      isChange = false;
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => UserInfo(),
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
