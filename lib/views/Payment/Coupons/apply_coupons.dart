import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydr/utils/images_path.dart';
import 'package:rydr/utils/margins.dart';
import 'package:rydr/views/Authentication/mobile_auth.dart';
import 'package:rydr/views/Home/Components/home_extention.dart';
import 'package:rydr/views/Payment/payment.dart';
import 'package:rydr/utils/colors.dart';

class ApplyCoupon extends StatelessWidget {
  final TextEditingController coupontextEditingController =
      TextEditingController();
  ApplyCoupon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75.0),
        child: CustomAppBar(title: "Apply Coupons"),
      ),
      body: SingleChildScrollView(
        child: FadeInUp(
          duration: Duration(milliseconds: 2000),
          child: Column(
            children: [
              YMargin(20),
              CustomTextFieldWidget(
                controller: coupontextEditingController,
                keyboardType: TextInputType.text,
                autofill: [AutofillHints.name],
                hintText: 'Enter Coupon Code',
              ),
              YMargin(15),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Container(
                  height: 50,
                  width: context.screenWidth(),
                  decoration: BoxDecoration(
                    color: ColorPath.Secondarygrey,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Apply Coupon Code",
                          style: GoogleFonts.poppins(
                            color: ColorPath.Primarywhite,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ).ripple(() {}),
              ),
              YMargin(20),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Active Coupons",
                            style: GoogleFonts.poppins(
                              color: Color(0xFF818181),
                              fontSize: 9,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
              YMargin(15),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                    height: 120,
                    width: context.screenWidth(),
                    decoration: BoxDecoration(
                        color: ColorPath.GoldenColor,
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                            color: ColorPath.Primarydark.withOpacity(0.3))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image(image: AssetImage(ImagesAsset.ride)),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "🎉Congratulations!",
                              style: GoogleFonts.poppins(
                                color: ColorPath.Primarydark,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            YMargin(10),
                            Text(
                              "You have gotten 10% free Coupon \nfor our next trip.",
                              style: GoogleFonts.poppins(
                                color: ColorPath.Primarywhite,
                                fontSize: 10,
                                fontWeight: FontWeight.w300,
                              ),
                            )
                          ],
                        ),
                      ],
                    )),
              ),
              YMargin(15),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                    height: 120,
                    width: context.screenWidth(),
                    decoration: BoxDecoration(
                      color: Color(0XFF878E88),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image(image: AssetImage(ImagesAsset.cough)),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "😱Covid 19 Coupon!",
                              style: GoogleFonts.poppins(
                                color: ColorPath.Primarydark,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            YMargin(10),
                            Text(
                              "Get 60% off your next trip due to the \npandemic!",
                              style: GoogleFonts.poppins(
                                color: ColorPath.Primarywhite,
                                fontSize: 10,
                                fontWeight: FontWeight.w300,
                              ),
                            )
                          ],
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
