import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydr/utils/images_path.dart';
import 'package:rydr/utils/margins.dart';
import 'package:rydr/views/Payment/payment.dart';
import 'package:rydr/utils/colors.dart';

class AddPaymethod extends StatefulWidget {
  const AddPaymethod({Key? key}) : super(key: key);

  @override
  State<AddPaymethod> createState() => _AddPaymethodState();
}

class _AddPaymethodState extends State<AddPaymethod> {
  String? payment = "cash";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75.0),
        child: CustomAppBar(title: "Add Payment Method"),
      ),
      body: FadeInUp(
        duration: Duration(milliseconds: 2000),
        child: Column(
          children: [
            YMargin(30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                children: [
                  Text(
                    "How would you like to pay for your trips!",
                    style: GoogleFonts.montserrat(
                      fontSize: 11.0,
                      fontWeight: FontWeight.w500,
                      color: ColorPath.Primarydark,
                    ),
                  ),
                ],
              ),
            ),
            YMargin(30),
            Container(
              height: 85,
              width: context.screenWidth(),
              decoration: BoxDecoration(
                color: payment == "cash"
                    ? ColorPath.Primarydark
                    : ColorPath.SecondaryColor.withOpacity(0.3),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      XMargin(20),
                      SvgPicture.asset(
                        ImagesAsset.money1,
                        color: payment == "cash"
                            ? ColorPath.SecondaryColor
                            : ColorPath.Primarydark,
                      ),
                      XMargin(10),
                      Text(
                        "Pay with Cash",
                        style: GoogleFonts.montserrat(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w600,
                          color: payment != "cash"
                              ? ColorPath.Primarydark
                              : ColorPath.SecondaryColor,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        activeColor: ColorPath.SecondaryColor,
                        value: "cash",
                        onChanged: (value) {
                          setState(() {
                            payment = value.toString();
                          });
                        },
                        groupValue: payment,
                      ),
                      XMargin(20),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 85,
              width: context.screenWidth(),
              decoration: BoxDecoration(
                color: payment != "cash"
                    ? ColorPath.Primarydark
                    : ColorPath.SecondaryColor.withOpacity(0.3),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      XMargin(20),
                      SvgPicture.asset(
                        ImagesAsset.card,
                        color: payment != "cash"
                            ? ColorPath.SecondaryColor
                            : ColorPath.Primarydark,
                      ),
                      XMargin(10),
                      Text(
                        "Pay with Debit or Credit Card",
                        style: GoogleFonts.montserrat(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w600,
                          color: payment != "cash"
                              ? ColorPath.SecondaryColor
                              : ColorPath.Primarydark,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        activeColor: ColorPath.SecondaryColor,
                        value: "card",
                        onChanged: (value) {
                          setState(() {
                            payment = value.toString();
                          });
                        },
                        groupValue: payment,
                      ),
                      XMargin(20),
                    ],
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
