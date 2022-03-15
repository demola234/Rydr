import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydr/utils/images_path.dart';
import 'package:rydr/utils/margins.dart';
import 'Components/sheet_header.dart';
import 'arrived_destination.dart';
import 'build_trip_details.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rydr/utils/colors.dart';
import 'drivers_details.dart';

buildEnjoyRide(BuildContext context) {
  Navigator.pop(context);
  showModalBottomSheet(
      isDismissible: false,
      isScrollControlled: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      clipBehavior: Clip.hardEdge,
      context: context,
      builder: (context) {
        return EnjoyRide();
      });
}

class EnjoyRide extends StatefulWidget {
  const EnjoyRide({
    Key? key,
  }) : super(key: key);

  @override
  _EnjoyRideState createState() => _EnjoyRideState();
}

class _EnjoyRideState extends State<EnjoyRide> {
  @override
  void initState() {
    setState(() {
      Future.delayed(Duration(seconds: 5), () {
        arrivedDestination(context);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 7),
      height: context.screenHeight() / 1.8,
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
              "Enjoy your Ryde",
              style: GoogleFonts.montserrat(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                color: ColorPath.Primarydark,
              ),
            ),
            Text(
              "Buckle Up and have a safe trip",
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
            YMargin(14),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
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
                      Row(
                        children: [
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  driversDetail(context);
                                },
                                child: Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              ImagesAsset.driverpic))),
                                ),
                              ),
                              XMargin(10),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
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
                                ],
                              ),
                            ],
                          ),
                          XMargin(35),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "N1,100",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w700,
                                    color: ColorPath.Primarydark,
                                  ),
                                ),
                                Text(
                                  "Final Cost",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.w400,
                                    color: ColorPath.Primarydark,
                                  ),
                                ),
                              ])
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            YMargin(14),
            DotWidget(
              dashColor: ColorPath.Primaryfield,
              dashHeight: 1.0,
              dashWidth: 2.0,
            ),
            YMargin(14),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Trip Details",
                    style: GoogleFonts.montserrat(
                      fontSize: 9.0,
                      fontWeight: FontWeight.w300,
                      color: ColorPath.offBlack,
                    ),
                  ),
                  YMargin(5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(ImagesAsset.side),
                      XMargin(10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Current Location",
                            style: GoogleFonts.montserrat(
                              fontSize: 9.0,
                              fontWeight: FontWeight.w400,
                              color: ColorPath.offBlack,
                            ),
                          ),
                          YMargin(5),
                          Text(
                            "Kwara Mall, Ilorin",
                            style: GoogleFonts.montserrat(
                              fontSize: 9.0,
                              fontWeight: FontWeight.w300,
                              color: Color(0xFF818181),
                            ),
                          ),
                          YMargin(30),
                          Text(
                            "Destination",
                            style: GoogleFonts.montserrat(
                              fontSize: 9.0,
                              fontWeight: FontWeight.w400,
                              color: ColorPath.offBlack,
                            ),
                          ),
                          YMargin(5),
                          Text(
                            "Kwara Mall, Ilorin",
                            style: GoogleFonts.montserrat(
                              fontSize: 9.0,
                              fontWeight: FontWeight.w300,
                              color: ColorPath.offBlack,
                            ),
                          ),
                        ],
                      ),
                    ],
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
            YMargin(14),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text(
                        "Share ride info with:",
                        style: GoogleFonts.montserrat(
                          fontSize: 9.0,
                          fontWeight: FontWeight.w300,
                          color: ColorPath.offBlack,
                        ),
                      ),
                      YMargin(10),
                      Row(
                        children: [
                          Container(
                            height: 34,
                            width: 34,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(ImagesAsset.driverpic))),
                          ),
                          XMargin(5),
                          Text(
                            "Isreal John",
                            style: GoogleFonts.montserrat(
                              fontSize: 9.0,
                              fontWeight: FontWeight.w300,
                              color: ColorPath.offBlack,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Share ride details on:",
                        style: GoogleFonts.montserrat(
                          fontSize: 9.0,
                          fontWeight: FontWeight.w300,
                          color: ColorPath.offBlack,
                        ),
                      ),
                      YMargin(10),
                      Row(
                        children: [
                          Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(ImagesAsset.whatsapp))),
                          ),
                          XMargin(5),
                          Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(ImagesAsset.twitter))),
                          ),
                          XMargin(5),
                          Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(ImagesAsset.facebook))),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
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
