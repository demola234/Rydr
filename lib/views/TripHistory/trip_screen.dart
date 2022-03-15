import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydr/utils/images_path.dart';
import 'package:rydr/utils/margins.dart';
import 'package:rydr/views/Payment/payment.dart';
import 'package:rydr/views/Home/Components/home_extention.dart';
import 'package:rydr/utils/colors.dart';
import 'trip_history.dart';

class TripScreen extends StatelessWidget {
  const TripScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75.0),
        child: CustomAppBar(title: "Your Trip History"),
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
                    return tripCard(context);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget tripCard(BuildContext context) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5.0),
      height: 65,
      width: context.screenWidth(),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: ColorPath.Primaryfield,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
                    "Kwara Mall,  Ilorin",
                    style: GoogleFonts.montserrat(
                      fontSize: 10.0,
                      fontWeight: FontWeight.w600,
                      color: ColorPath.Primarydark,
                    ),
                  ),
                  YMargin(5),
                  Text(
                    "10th January, 2021, 10: 00am",
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "N2,300",
                style: GoogleFonts.montserrat(
                  fontSize: 10.0,
                  fontWeight: FontWeight.w600,
                  color: ColorPath.Primarydark,
                ),
              ),
              YMargin(5),
              Text(
                "Trip Completed",
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
    ).ripple(() {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TripHistory(),
          ));
    }),
  );
}
