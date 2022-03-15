import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydr/utils/images_path.dart';
import 'package:rydr/utils/margins.dart';
import 'package:rydr/views/Authentication/mobile_auth.dart';
import 'package:rydr/views/Home/Components/home_extention.dart';
import 'package:rydr/utils/colors.dart';
import 'add_payment_method.dart';

class Payments extends StatefulWidget {
  Payments({Key? key}) : super(key: key);

  @override
  _PaymentsState createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  TextEditingController coupontextEditingController = TextEditingController();
  String? payment = "cash";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75.0),
        child: CustomAppBar(title: "Payment"),
      ),
      body: Column(
        children: [
          YMargin(20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FadeInUp(
                  duration: Duration(milliseconds: 1800),
                  child: Container(
                    width: 340,
                    height: 122,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorPath.Primarydark,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(ImagesAsset.paybg),
                        )),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Rydr Balance",
                          style: GoogleFonts.montserrat(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                            color: ColorPath.SecondaryColor,
                          ),
                        ),
                        YMargin(10),
                        Text(
                          "N13,300",
                          style: GoogleFonts.montserrat(
                            fontSize: 36.0,
                            fontWeight: FontWeight.w600,
                            color: ColorPath.SecondaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          YMargin(30),
          FadeInUp(
            duration: Duration(milliseconds: 2000),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      Text(
                        "Payment Methods",
                        style: GoogleFonts.montserrat(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                          color: ColorPath.Primarydark,
                        ),
                      ),
                    ],
                  ),
                ),
                YMargin(20),
                Container(
                  height: 85,
                  width: context.screenWidth(),
                  decoration: BoxDecoration(color: ColorPath.Primarydark),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          XMargin(20),
                          SvgPicture.asset(ImagesAsset.money1),
                          XMargin(10),
                          Text(
                            "Pay with Cash",
                            style: GoogleFonts.montserrat(
                              fontSize: 13.0,
                              fontWeight: FontWeight.w600,
                              color: ColorPath.SecondaryColor,
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
                YMargin(15),
                Container(
                  height: 52,
                  width: context.screenWidth(),
                  decoration: BoxDecoration(color: ColorPath.Primaryfield),
                  child: Row(
                    children: [
                      XMargin(20),
                      Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          color: ColorPath.Primarydark,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.add,
                          size: 15,
                          color: ColorPath.Primaryfield,
                        ),
                      ),
                      XMargin(10),
                      Text(
                        "Add Payment Method",
                        style: GoogleFonts.montserrat(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w600,
                          color: ColorPath.Primarydark,
                        ),
                      ),
                    ],
                  ),
                ).ripple(() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddPaymethod()));
                }),
                YMargin(20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      Text(
                        "Apply Coupon",
                        style: GoogleFonts.montserrat(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                          color: ColorPath.Primarydark,
                        ),
                      ),
                    ],
                  ),
                ),
                YMargin(10),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  final String title;
  CustomAppBar({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        brightness: Brightness.dark,
        backgroundColor: ColorPath.Primarydark,
        automaticallyImplyLeading: false,
        centerTitle: true,
        leadingWidth: 67,
        title: Text(
          title,
          style: GoogleFonts.montserrat(
            fontSize: 18.0,
            fontWeight: FontWeight.w400,
            color: ColorPath.Primarywhite,
          ),
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: 15),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                  color: ColorPath.Primaryfield,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: Center(
                  child: Icon(
                Icons.arrow_back_ios,
                size: 18,
                color: ColorPath.Primarydark,
              )),
            ),
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light);
  }
}
