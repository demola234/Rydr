import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydr/utils/margins.dart';
import 'package:rydr/views/Authentication/components/auth_header.dart';
import 'package:rydr/views/Authentication/verify_otp.dart';
import 'package:rydr/views/Home/Components/home_extention.dart';
import 'package:rydr/utils/colors.dart';

class MobileAuth extends StatefulWidget {
  MobileAuth({Key? key}) : super(key: key);

  @override
  _MobileAuthState createState() => _MobileAuthState();
}

class _MobileAuthState extends State<MobileAuth> {
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
        child: FadeInDown(
          duration: Duration(
            milliseconds: 2000,
          ),
          child: Column(
            children: [
              YMargin(100),
              authHeader(context),
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
                  Text("Please enter your Mobile Number",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.normal,
                        color: ColorPath.Primarydark,
                        fontSize: 14,
                      )),
                  YMargin(3.0),
                  Text("An OTP will be sent you for verification?",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        color: ColorPath.PrimaryColor,
                        fontSize: 9.0,
                      )),
                ],
              ),
              YMargin(25),
              CustomTextFieldWidget(
                controller: phonetextEditingController,
                keyboardType: TextInputType.phone,
                autofill: [AutofillHints.telephoneNumberAreaCode],
                hintText: 'Mobile Number',
                prefixWidget: DropdownButtonHideUnderline(
                    child: ButtonTheme(
                        alignedDropdown: true, child: Text("+234 |  "))),
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
                              phonetextEditingController.clear();
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => VerifyOtp(
                                        phonenumber:
                                            phonetextEditingController.text),
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
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextFieldWidget extends StatelessWidget {
  final String hintText;
  final TextInputType? keyboardType;
  final Iterable<String>? autofill;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final bool hideText;
  final Color fillcolour;
  final Function(String)? onChanged;

  const CustomTextFieldWidget(
      {Key? key,
      required this.controller,
      this.hintText: 'A Text is missing HERE!',
      this.keyboardType,
      this.autofill,
      this.prefixWidget,
      this.hideText: false,
      this.suffixWidget,
      this.fillcolour: ColorPath.Primaryfield,
      this.onChanged})
      : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      height: 50,
      child: TextField(
        onChanged: onChanged,
        obscureText: hideText,
        controller: controller,
        cursorColor: ColorPath.Primaryblack,
        keyboardType: keyboardType,
        autofillHints: autofill,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          prefix: prefixWidget,
          filled: true,
          fillColor: fillcolour,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
            borderSide: BorderSide(
              color: Color(0xFFd4f0ff),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
            borderSide: BorderSide(
              color: ColorPath.Primaryfield,
            ),
          ),
          hintText: hintText,
          alignLabelWithHint: true,
          hintStyle: GoogleFonts.montserrat(
            fontSize: 13,
            color: Color(0xFF77869E),
          ),
        ),
      ),
    );
  }
}

class CustomDropdown extends StatelessWidget {
  final dropdownValue;
  final List items;
  final Function(String? value)? onChanged;
  final Color backgroundColour;

  const CustomDropdown({
    Key? key,
    this.dropdownValue,
    required this.items,
    this.onChanged,
    this.backgroundColour: ColorPath.Primarywhite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 45,
      decoration: BoxDecoration(
        color: backgroundColour,
        borderRadius: BorderRadius.circular(9),
        border: Border.all(
          color: Color(0xFF0647b0),
          width: 0.1,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: dropdownValue,
          items: items
              .map<DropdownMenuItem<String>>(
                (value) => DropdownMenuItem(
                  value: value,
                  child: Text(value),
                ),
              )
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}

class NumericPad extends StatelessWidget {
  final Function(int) onNumberSelected;
  final Function(bool)? onValidate;

  NumericPad({
    required this.onNumberSelected,
    this.onValidate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFE7E8E7),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    numberContainer(1),
                    numberContainer(2),
                    numberContainer(3),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    numberContainer(4),
                    numberContainer(5),
                    numberContainer(6),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    numberContainer(7),
                    numberContainer(8),
                    numberContainer(9),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    buildBackspace(),
                    numberContainer(0),
                    validateContainer(context)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget numberContainer(int number) {
    return Expanded(
        child: Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.only(top: 16, bottom: 16),
        decoration: BoxDecoration(
          color: Color(0xffFFFFFF),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Center(
          child: Text(
            number.toString(),
            style: GoogleFonts.montserrat(
              fontSize: 26,
              fontWeight: FontWeight.w400,
              color: Color(0xFF41536C),
            ),
          ),
        ),
      ).ripple(
        () {
          onNumberSelected(number);
        },
      ),
    ));
  }

  Widget buildBackspace() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          padding: EdgeInsets.only(top: 16, bottom: 16),
          decoration: BoxDecoration(
            color: Color(0xffF7F9FD),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Center(
            child: Icon(
              Icons.backspace,
              size: 28,
              color: ColorPath.offWhite,
            ),
          ),
        ).ripple(
          () {
            onNumberSelected(-1);
          },
        ),
      ),
    );
  }

  Widget validateContainer(context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: EdgeInsets.only(top: 16, bottom: 16),
        decoration: BoxDecoration(
          color: ColorPath.Primarydark,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Center(
          child: Icon(
            Icons.arrow_forward,
            size: 28,
            color: ColorPath.Primarywhite,
          ),
        ),
      ).ripple(() {
        onValidate!(true);
      }),
    ));
  }

  Widget emptyContainer(context) {
    return Expanded(
        child: GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          padding: EdgeInsets.only(top: 16, bottom: 16),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
        ),
      ),
    ));
  }
}
