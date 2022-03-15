import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydr/utils/images_path.dart';
import 'package:rydr/utils/margins.dart';
import 'package:rydr/views/Authentication/components/auth_header.dart';
import 'package:rydr/views/Authentication/email_verification.dart';
import 'package:rydr/utils/colors.dart';
import 'package:rydr/views/Authentication/mobile_auth.dart';

class VerifyOtp extends StatefulWidget {
  final String phonenumber;

  VerifyOtp({required this.phonenumber, Key? key}) : super(key: key);

  @override
  _VerifyOtpState createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  String code = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorPath.Primarywhite,
        body: Column(children: [
          YMargin(60),
          authHeader(context),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Verify Number",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w500,
                  color: ColorPath.Primarydark,
                  fontSize: 23,
                ),
              ),
              YMargin(10),
              Text("We sent a verification code to your phone number",
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    color: ColorPath.PrimaryColor,
                    fontSize: 9.0,
                  )),
            ],
          ),
          YMargin(10),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(ImagesAsset.check),
                        Text("+234" + widget.phonenumber,
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              color: ColorPath.PrimaryColor,
                              fontSize: 9.0,
                            )),
                        SvgPicture.asset(ImagesAsset.pen),
                      ],
                    ),
                    Container(
                      height: 30,
                      width: 90,
                      decoration: BoxDecoration(
                          color: ColorPath.Primarydark,
                          borderRadius: BorderRadius.circular(5.0)),
                      child: InkWell(
                        onTap: () {},
                        child: Center(
                            child: Text("Resend",
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w500,
                                  color: ColorPath.Primarywhite,
                                  fontSize: 9.0,
                                ))),
                      ),
                    ),
                  ])),
          YMargin(5),
          Text("Enter the 6 digit otp",
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w500,
                color: ColorPath.PrimaryColor,
                fontSize: 9.0,
              )),
          YMargin(8.0),
          SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                buildCodeNumberBox(code.length > 0 ? code.substring(0, 1) : ""),
                buildCodeNumberBox(code.length > 1 ? code.substring(1, 2) : ""),
                buildCodeNumberBox(code.length > 2 ? code.substring(2, 3) : ""),
                buildCodeNumberBox(code.length > 3 ? code.substring(3, 4) : ""),
                buildCodeNumberBox(code.length > 4 ? code.substring(4, 5) : ""),
                buildCodeNumberBox(code.length > 5 ? code.substring(5, 6) : ""),
              ],
            ),
          ),
          YMargin(15),
          Spacer(),
          NumericPad(
            onNumberSelected: (value) {
              setState(() {
                if (value != -1) {
                  if (code.length < 6) {
                    code = code + value.toString();
                  }
                } else {
                  code = code.substring(0, code.length - 1);
                }
              });
            },
            onValidate: (value) {
              //CheckOtp Valid
              if (code.length == 6 && code == "123456") {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EmailVerification()));
              } else {}
            },
          ),
          Spacer(),
        ]));
  }

  Widget buildCodeNumberBox(String codeNumber) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 4),
        child: SizedBox(
          width: 47,
          height: 44,
          child: Container(
            decoration: BoxDecoration(
                color: ColorPath.PrimaryColor.withOpacity(0.3),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
                border: Border.all(color: ColorPath.PrimaryColor, width: 0.5)),
            child: Center(
              child: Text(
                codeNumber,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: ColorPath.offWhite,
                ),
              ),
            ),
          ),
        ));
  }
}
