import 'dart:async';
import 'package:rydr/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydr/utils/images_path.dart';
import 'package:rydr/utils/margins.dart';
import 'Components/sheet_header.dart';
import 'booking_details.dart';
import 'build_trip_details.dart';
import 'drivers_details.dart';

buildConfirmTrip(BuildContext context) {
  Navigator.pop(context);
  showModalBottomSheet(
      isDismissible: false,
      isScrollControlled: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      clipBehavior: Clip.hardEdge,
      context: context,
      builder: (context) {
        return BookingComfirm();
      });
}

class BookingComfirm extends StatefulWidget {
  const BookingComfirm({
    Key? key,
  }) : super(key: key);

  @override
  _BookingComfirmState createState() => _BookingComfirmState();
}

class _BookingComfirmState extends State<BookingComfirm> {
  @override
  void initState() {
    setState(() {
      Future.delayed(Duration(seconds: 5), () {
        Navigator.pop(context);
        buildBookingDetails(context);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 7),
      height: context.screenHeight() / 3,
      width: context.screenWidth(),
      decoration: BoxDecoration(
        color: ColorPath.Primarywhite,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Container(
        child: Column(
          children: [
            sheetHeader(),
            YMargin(15),
            Text(
              "Booking confimed",
              style: GoogleFonts.montserrat(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                color: ColorPath.Primarydark,
              ),
            ),
            Text(
              "Rydr has accepted your booking. Finding you a driver",
              style: GoogleFonts.montserrat(
                fontSize: 11.0,
                fontWeight: FontWeight.w300,
                color: ColorPath.offBlack,
              ),
            ),
            YMargin(10),
            DotWidget(
              dashColor: ColorPath.Primaryfield,
              dashHeight: 1.0,
              dashWidth: 2.0,
            ),
            YMargin(10),
            Container(
              height: 70,
              width: 70,
              child: Image(
                image: AssetImage(ImagesAsset.ripple),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          driversDetail(context);
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(ImagesAsset.driverpic))),
                        ),
                      ),
                      YMargin(8.0),
                      Text(
                        "Your Driver",
                        style: GoogleFonts.montserrat(
                          fontSize: 10.0,
                          fontWeight: FontWeight.w400,
                          color: ColorPath.Primarydark,
                        ),
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: ColorPath.Primarydark,
                              borderRadius: BorderRadius.all(
                                Radius.circular(11),
                              )),
                          child: SvgPicture.asset(ImagesAsset.cancelride),
                        ),
                        YMargin(8.0),
                        Text(
                          "Cancel Ride",
                          style: GoogleFonts.montserrat(
                            fontSize: 10.0,
                            fontWeight: FontWeight.w400,
                            color: ColorPath.Primarydark,
                          ),
                        )
                      ],
                    ),
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
