import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydr/utils/images_path.dart';
import 'package:rydr/utils/margins.dart';
import 'package:rydr/views/Authentication/verify_otp.dart';

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
                "Let’s know you",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF1F2421),
                  fontSize: 23,
                ),
              ),
              YMargin(10),
              Text("Please enter your Mobile Number",
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.normal,
                    color: Color(0xFF1F2421),
                    fontSize: 14,
                  )),
              YMargin(3.0),
              Text("An OTP will be sent you for verification?",
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF878E88),
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

class CustomTextFieldWidget extends StatelessWidget {
  final String hintText;
  final TextInputType? keyboardType;
  final Iterable<String>? autofill;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final bool hideText;
  final Color fillcolour;
  final  Function(String)? onChanged;


  const CustomTextFieldWidget({
    Key? key,
    required this.controller,
    this.hintText: 'A Text is missing HERE!',
    this.keyboardType,
    this.autofill,
    this.prefixWidget,
    this.hideText: false,
    this.suffixWidget,
    this.fillcolour: const Color(0xFFDCE1DE),
    this.onChanged
  }) : super(key: key);

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
        cursorColor: Color(0xFF000000),
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
              color: Color(0xFFDCE1DE),
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
    this.backgroundColour: Colors.white,
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
    );
  }

  Widget numberContainer(int number) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          onNumberSelected(number);
        },
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
          ),
        ),
      ),
    );
  }

  Widget buildBackspace() {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          onNumberSelected(-1);
        },
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
                color: Color(0xFF1F1F1F),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget validateContainer(context) {
    return Expanded(
        child: GestureDetector(
      onTap: () {
        onValidate!(true);
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          padding: EdgeInsets.only(top: 16, bottom: 16),
          decoration: BoxDecoration(
            color: Color(0xFF1F2421),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Center(
            child: Icon(
              Icons.arrow_forward,
              size: 28,
              color: Color(0xFFFFFFFF),
            ),
          ),
        ),
      ),
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
