import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydr/utils/images_path.dart';
import 'package:rydr/utils/margins.dart';
import 'package:rydr/views/Payment/payment.dart';
import 'package:rydr/utils/colors.dart';

class Notifications extends StatelessWidget {
  Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75.0),
        child: CustomAppBar(title: "Notification"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            YMargin(30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Row(
                children: [
                  Container(
                    width: 90,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: ColorPath.Primarydark,
                    ),
                    child: Center(
                      child: Text(
                        "10th January 2022",
                        style: GoogleFonts.montserrat(
                          fontSize: 9.0,
                          fontWeight: FontWeight.w300,
                          color: ColorPath.SecondaryColor,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            FadeInUp(
              duration: Duration(milliseconds: 2000),
              child: Container(
                height: context.screenHeight(),
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return notificationCard(context);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget notificationCard(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5.0),
        height: 65,
        width: context.screenWidth(),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: ColorPath.Primaryfield,
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: Image(image: AssetImage(ImagesAsset.rydrlogo)),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Get Free Coupons ",
                  style: GoogleFonts.montserrat(
                    fontSize: 10.0,
                    fontWeight: FontWeight.w600,
                    color: ColorPath.Primarydark,
                  ),
                ),
                YMargin(5),
                Text(
                  "Hello, You can get free Coupons for your next trip by referring us!",
                  style: GoogleFonts.montserrat(
                    fontSize: 7.0,
                    fontWeight: FontWeight.w300,
                    color: ColorPath.Primarydark,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
