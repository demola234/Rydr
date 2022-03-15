import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydr/utils/colors.dart';
import 'package:rydr/utils/margins.dart';
import 'package:rydr/views/Authentication/mobile_auth.dart';
import 'package:rydr/views/Payment/payment.dart';
import 'package:rydr/views/Home/Components/home_extention.dart';

class ManagePassword extends StatefulWidget {
  const ManagePassword({Key? key}) : super(key: key);

  @override
  _ManagePasswordState createState() => _ManagePasswordState();
}

class _ManagePasswordState extends State<ManagePassword> {
  TextEditingController passwordtexteditingcontroller = TextEditingController();
  TextEditingController confirmpasswordtexteditingcontroller =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75.0),
        child: CustomAppBar(title: "Manage Password"),
      ),
      body: FadeInUp(
        duration: Duration(milliseconds: 2000),
        child: Column(
          children: [
            YMargin(50),
            CustomTextFieldWidget(
              controller: passwordtexteditingcontroller,
              hideText: true,
              keyboardType: TextInputType.visiblePassword,
              autofill: [AutofillHints.password],
              hintText: 'Password',
            ),
            YMargin(8.0),
            CustomTextFieldWidget(
              controller: confirmpasswordtexteditingcontroller,
              hideText: true,
              keyboardType: TextInputType.visiblePassword,
              autofill: [AutofillHints.password],
              hintText: 'Confirm Password',
            ),
            YMargin(20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                height: 50,
                width: context.screenWidth(),
                decoration: BoxDecoration(
                  color: ColorPath.Secondarygrey,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Update Password",
                      style: GoogleFonts.poppins(
                        color: ColorPath.Primarywhite,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ).ripple(() {}),
            ),
          ],
        ),
      ),
    );
  }
}
