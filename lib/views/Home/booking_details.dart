import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydr/utils/images_path.dart';
import 'package:rydr/utils/margins.dart';
import 'Components/sheet_header.dart';
import 'build_trip_details.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rydr/views/Home/Components/home_extention.dart';
import 'package:rydr/utils/colors.dart';
import 'chat_with_driver.dart';
import 'drivers_details.dart';
import 'enjoy_ride.dart';

buildBookingDetails(BuildContext context) {
  showModalBottomSheet(
      isDismissible: false,
      isScrollControlled: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      clipBehavior: Clip.hardEdge,
      context: context,
      builder: (context) {
        return BookingDetials();
      });
}

class BookingDetials extends StatefulWidget {
  const BookingDetials({
    Key? key,
  }) : super(key: key);

  @override
  _BookingDetialsState createState() => _BookingDetialsState();
}

class _BookingDetialsState extends State<BookingDetials> {
  @override
  void initState() {
    setState(() {
      Future.delayed(Duration(seconds: 5), () {
        buildEnjoyRide(context);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 7),
      height: context.screenHeight() / 2.5,
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
              "Booking Details",
              style: GoogleFonts.montserrat(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                color: ColorPath.Primarydark,
              ),
            ),
            Text(
              "Your Driver is making this way  to you!",
              style: GoogleFonts.montserrat(
                fontSize: 11.0,
                fontWeight: FontWeight.w300,
                color: ColorPath.offBlack,
              ),
            ),
            YMargin(14),
            DotWidget(
              dashColor: ColorPath.Primaryfield,
              dashHeight: 1.0,
              dashWidth: 2.0,
            ),
            YMargin(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "DRIVERS INFORMATION",
                        style: GoogleFonts.montserrat(
                          fontSize: 9.0,
                          fontWeight: FontWeight.w300,
                          color: ColorPath.offBlack,
                        ),
                      ),
                      YMargin(10),
                      Text(
                        "David James",
                        style: GoogleFonts.montserrat(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w700,
                          color: ColorPath.Primarydark,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "Toyata Camery 2010 |",
                            style: GoogleFonts.montserrat(
                              fontSize: 10.0,
                              fontWeight: FontWeight.w400,
                              color: ColorPath.Primarydark,
                            ),
                          ),
                          Text(
                            "237183AR",
                            style: GoogleFonts.montserrat(
                              fontSize: 10.0,
                              fontWeight: FontWeight.w600,
                              color: ColorPath.Primarydark,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Black Color",
                        style: GoogleFonts.montserrat(
                          fontSize: 10.0,
                          fontWeight: FontWeight.w400,
                          color: ColorPath.Primarydark,
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      driversDetail(context);
                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(ImagesAsset.driverpic))),
                    ),
                  ),
                ],
              ),
            ),
            YMargin(14),
            DotWidget(
              dashColor: ColorPath.Primaryfield,
              dashHeight: 1.0,
              dashWidth: 2.0,
            ),
            YMargin(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "AVERAGE DRIVER RATING",
                        style: GoogleFonts.montserrat(
                          fontSize: 9.0,
                          fontWeight: FontWeight.w300,
                          color: ColorPath.offBlack,
                        ),
                      ),
                      YMargin(5.0),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 13,
                            color: ColorPath.Primarydark,
                          ),
                          Icon(
                            Icons.star,
                            size: 13,
                            color: ColorPath.Primarydark,
                          ),
                          Icon(
                            Icons.star,
                            size: 13,
                            color: ColorPath.Primarydark,
                          ),
                          Icon(
                            Icons.star,
                            size: 13,
                            color: ColorPath.Primarydark,
                          ),
                          Icon(
                            Icons.star,
                            size: 13,
                            color: ColorPath.PrimaryColor,
                          ),
                          Text(
                            "4.7",
                            style: GoogleFonts.montserrat(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w700,
                              color: ColorPath.Primarydark,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(15.0),
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: ColorPath.Primarydark,
                            borderRadius: BorderRadius.all(
                              Radius.circular(11),
                            )),
                        child: SvgPicture.asset(ImagesAsset.message),
                      ).ripple(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatWithDriver(),
                            ));
                      }),
                      XMargin(5.0),
                      Container(
                        padding: const EdgeInsets.all(15.0),
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: ColorPath.Primarydark,
                            borderRadius: BorderRadius.all(
                              Radius.circular(11),
                            )),
                        child: SvgPicture.asset(ImagesAsset.call,
                            height: 12, width: 12),
                      ),
                    ],
                  )
                ],
              ),
            ),
            YMargin(10.0),
            DotWidget(
              dashColor: ColorPath.Primaryfield,
              dashHeight: 1.0,
              dashWidth: 2.0,
            ),
            YMargin(10.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  ImagesAsset.time,
                  height: 12,
                  width: 12,
                  color: Color(0xFF999393),
                ),
                XMargin(5),
                Text(
                  "Driver Arrives In 5 munites",
                  style: GoogleFonts.montserrat(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF999393),
                  ),
                ),
              ],
            ),
            YMargin(10.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Container(
                height: 40,
                width: context.screenWidth(),
                decoration: BoxDecoration(
                  color: ColorPath.Primaryred,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Canel Ride",
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
    );
  }
}
