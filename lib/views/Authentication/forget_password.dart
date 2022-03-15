import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydr/utils/margins.dart';
import 'package:rydr/views/Authentication/components/auth_header.dart';
import 'package:rydr/views/Authentication/mobile_auth.dart';
import 'package:rydr/utils/colors.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController phonetextEditingController = TextEditingController();

  String code = "";

  bool isChange = false;

  @override
  void initState() {
    super.initState();
    phonetextEditingController = TextEditingController();
    phonetextEditingController.addListener(() {
      final isChange = phonetextEditingController.text.isNotEmpty;
      setState(() {
        this.isChange = isChange;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    phonetextEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorPath.Primarywhite,
        body: SingleChildScrollView(
          child: Column(children: [
            YMargin(100),
            authHeader(context),
            FadeInDown(
              child: Column(
                children: [
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
                              "Forget Password",
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w500,
                                color: ColorPath.Primarydark,
                                fontSize: 18,
                              ),
                            ),
                            YMargin(10),
                            Text(
                                "Did you forget your password? You can easily retrive it \nby telling us your mobile number!",
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.normal,
                                  color: ColorPath.Primarydark,
                                  fontSize: 10,
                                )),
                          ],
                        ),
                      ),
                      YMargin(50),
                      CustomTextFieldWidget(
                        controller: phonetextEditingController,
                        keyboardType: TextInputType.phone,
                        autofill: [AutofillHints.telephoneNumberAreaCode],
                        hintText: 'Mobile Number',
                        prefixWidget: DropdownButtonHideUnderline(
                            child: ButtonTheme(
                                alignedDropdown: true,
                                child: Text("+234 |  "))),
                      ),
                      YMargin(20),
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
                                  "Submit",
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
                ],
              ),
            ),
          ]),
        ));
  }
}
