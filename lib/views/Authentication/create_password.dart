import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydr/utils/images_path.dart';
import 'package:rydr/utils/margins.dart';
import 'package:rydr/views/Authentication/mobile_auth.dart';
import 'package:rydr/views/Authentication/user_info.dart';

class PasswordVerification extends StatefulWidget {
  const PasswordVerification({Key? key}) : super(key: key);

  @override
  State<PasswordVerification> createState() => _PasswordVerificationState();
}

class _PasswordVerificationState extends State<PasswordVerification> {
  TextEditingController passwordtexteditingcontroller = TextEditingController();
  String code = "";
  bool isChange = false;

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
      backgroundColor: Colors.white,
      body: Column(
        children: [
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
                    fit: BoxFit.contain,
                    image: AssetImage(
                      ImagesAsset.AUTHIMAGE1,
                    ))),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Secure your account",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF1F2421),
                  fontSize: 23,
                ),
              ),
              YMargin(15),
              Text("Create your password",
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF1F2421),
                    fontSize: 14,
                  )),
            ],
          ),
          YMargin(35),
          CustomTextFieldWidget(
            controller: passwordtexteditingcontroller,
            hideText: true,
            keyboardType: TextInputType.visiblePassword,
            autofill: [AutofillHints.password],
            hintText: 'Create password',
          ),
          YMargin(30),
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
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UserInfo(),
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
    );
  }
}
