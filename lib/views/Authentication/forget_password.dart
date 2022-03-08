import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydr/utils/images_path.dart';
import 'package:rydr/utils/margins.dart';
import 'package:rydr/views/Authentication/mobile_auth.dart';

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
                      "Forget Password",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF1F2421),
                        fontSize: 18,
                      ),
                    ),
                    YMargin(10),
                    Text(
                        "Did you forget your password? You can easily retrive it \nby telling us your mobile number!",
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF1F2421),
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
                        alignedDropdown: true, child: Text("+234 |  "))),
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
                          "Submit",
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
        ]));
  }
}
