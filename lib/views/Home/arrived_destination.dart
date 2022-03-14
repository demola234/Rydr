import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydr/models/trip_rating.dart';
import 'package:rydr/utils/images_path.dart';
import 'package:rydr/utils/margins.dart';
import 'package:rydr/views/Home/share_trip.dart';
import 'Components/rating_card.dart';
import 'Components/sheet_header.dart';
import 'build_trip_details.dart';
import 'package:flutter_svg/svg.dart';
import 'drivers_details.dart';

arrivedDestination(BuildContext context) {
  // Navigator.pop(context);
  showModalBottomSheet(
      isDismissible: false,
      isScrollControlled: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      clipBehavior: Clip.hardEdge,
      context: context,
      builder: (context) {
        return ArrivedDestination();
      });
}

class ArrivedDestination extends StatefulWidget {
  const ArrivedDestination({
    Key? key,
  }) : super(key: key);

  @override
  _ArrivedDestinationState createState() => _ArrivedDestinationState();
}

class _ArrivedDestinationState extends State<ArrivedDestination> {
  @override
  void initState() {
    setState(() {
      Future.delayed(Duration(seconds: 5), () {
        shareTripInfo(context);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 7),
      height: context.screenHeight() / 1.74,
      width: context.screenWidth(),
      decoration: BoxDecoration(
        color: Colors.white,
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
              "🎊 You Arrived",
              style: GoogleFonts.montserrat(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
                color: Color(0xFF1F2421),
              ),
            ),
            Text(
              "You have arrived at your destination",
              style: GoogleFonts.montserrat(
                fontSize: 11.0,
                fontWeight: FontWeight.w300,
                color: Color(0xFF50555C),
              ),
            ),
            YMargin(14),
            DotWidget(
              dashColor: Color(0xFFDCE1DE),
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
                          color: Color(0xFF50555C),
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
                                      color: Color(0xFF1F2421),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Toyata Camery 2010 |",
                                        style: GoogleFonts.montserrat(
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xFF1F2421),
                                        ),
                                      ),
                                      Text(
                                        "237183AR",
                                        style: GoogleFonts.montserrat(
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF1F2421),
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
                                    color: Color(0xFF1F2421),
                                  ),
                                ),
                                Text(
                                  "Final Cost",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF1F2421),
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
              dashColor: Color(0xFFDCE1DE),
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
                      color: Color(0xFF50555C),
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
                              color: Color(0xFF50555C),
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
                              color: Color(0xFF50555C),
                            ),
                          ),
                          YMargin(5),
                          Text(
                            "Kwara Mall, Ilorin",
                            style: GoogleFonts.montserrat(
                              fontSize: 9.0,
                              fontWeight: FontWeight.w300,
                              color: Color(0xFF50555C),
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
              dashColor: Color(0xFFDCE1DE),
              dashHeight: 1.0,
              dashWidth: 2.0,
            ),
            YMargin(14),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "How was your trip?",
                  style: GoogleFonts.montserrat(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1F2421),
                  ),
                ),
                YMargin(10.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 75),
                  child: Container(
                    height: 40,
                    // width: context.screenWidth(),
                    child: ListView(
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: RatingData.rideDetails
                          .map((rideDetails) => RideRating(
                              rideModel: rideDetails,
                              onSelected: (model) {
                                setState(() {
                                  RatingData.rideDetails.forEach((item) {
                                    item.isSelected = false;
                                  });
                                  model.isSelected = true;
                                });
                              }))
                          .toList(),
                    ),
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
                  color: Color(0xFF1F2421),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Share your info",
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
      ),
    );
  }
}
