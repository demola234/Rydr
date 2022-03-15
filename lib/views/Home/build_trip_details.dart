import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydr/utils/images_path.dart';
import 'package:rydr/utils/margins.dart';
import 'Components/sheet_header.dart';
import 'booking_comfirm.dart';
import 'build_select_ride.dart';
import 'package:rydr/utils/colors.dart';

buildTripDetails(BuildContext context) {
  Navigator.pop(context);
  showModalBottomSheet(
      isDismissible: false,
      isScrollControlled: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      clipBehavior: Clip.hardEdge,
      context: context,
      builder: (context) {
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
                  "Trip Details",
                  style: GoogleFonts.montserrat(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: ColorPath.Primarydark,
                  ),
                ),
                Text(
                  "Your Trip information",
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
                tripdetails(
                  ImagesAsset.down,
                  "Your Current Location",
                  "Ilorin, Kwara State",
                  "Estimated Distance",
                  ImagesAsset.run,
                  "Distance: 2.12 km",
                ),
                YMargin(15),
                DotWidget(
                  dashColor: ColorPath.Primaryfield,
                  dashHeight: 1.0,
                  dashWidth: 2.0,
                ),
                YMargin(15),
                tripdetails(
                  ImagesAsset.locate,
                  "Your Destination",
                  "Ilorin, Kwara State",
                  "Estimated time",
                  ImagesAsset.clock,
                  "4 munites 42 secs",
                ),
                YMargin(25),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Container(
                    height: 50,
                    width: context.screenWidth(),
                    decoration: BoxDecoration(
                      color: ColorPath.Primarygreen,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: InkWell(
                      onTap: () {
                        print("ssss");
                        Navigator.pop(context);
                        showModalBottomSheet(
                            isDismissible: false,
                            isScrollControlled: true,
                            elevation: 0,
                            backgroundColor: Colors.transparent,
                            clipBehavior: Clip.hardEdge,
                            context: context,
                            builder: (context) {
                              return Container(
                                padding: EdgeInsets.only(top: 7, bottom: 10),
                                height: context.screenHeight() / 2,
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
                                        "Select a ride",
                                        style: GoogleFonts.montserrat(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w500,
                                          color: ColorPath.Primarydark,
                                        ),
                                      ),
                                      Text(
                                        "🎊 Enjoy 5% discount on 1st three trips",
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
                                      RideDetails(),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 50),
                                        child: Container(
                                          height: 40,
                                          width: context.screenWidth(),
                                          decoration: BoxDecoration(
                                            color: ColorPath.Primarydark,
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: InkWell(
                                            onTap: () {
                                              buildConfirmTrip(context);
                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Book Rydr",
                                                  style: GoogleFonts.poppins(
                                                    color:
                                                        ColorPath.Primarywhite,
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
                            });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Confirm",
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
      });
}

Widget tripdetails(
  String icon,
  String locate,
  String location,
  String extimated,
  String eIcon,
  String eDistance,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(icon),
              ],
            ),
            XMargin(5),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  locate,
                  style: GoogleFonts.montserrat(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w600,
                    color: ColorPath.Primaryblack.withOpacity(0.5),
                  ),
                ),
                YMargin(10),
                Text(
                  location,
                  style: GoogleFonts.montserrat(
                    fontSize: 10.0,
                    fontWeight: FontWeight.w300,
                    color: Color(0xFF818181),
                  ),
                )
              ],
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              extimated,
              style: GoogleFonts.montserrat(
                fontSize: 9.0,
                fontWeight: FontWeight.w300,
                color: Color(0xFF818181),
              ),
            ),
            YMargin(2.0),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: ColorPath.Primarydark,
                  borderRadius: BorderRadius.circular(7.0)),
              child: Row(
                children: [
                  SvgPicture.asset(
                    eIcon,
                    height: 16,
                    width: 16,
                  ),
                  XMargin(4),
                  Text(
                    eDistance,
                    style: GoogleFonts.montserrat(
                      fontSize: 11.0,
                      fontWeight: FontWeight.w500,
                      color: ColorPath.Primaryfield,
                    ),
                  )
                ],
              ),
            )
          ],
        )
      ],
    ),
  );
}

class DotWidget extends StatelessWidget {
  final double totalWidth, dashWidth, emptyWidth, dashHeight;

  final Color dashColor;

  const DotWidget({
    this.totalWidth = 300,
    this.dashWidth = 10,
    this.emptyWidth = 5,
    this.dashHeight = 2,
    this.dashColor = Colors.black,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        totalWidth ~/ (dashWidth + emptyWidth),
        (_) => Container(
          width: dashWidth,
          height: dashHeight,
          color: dashColor,
          margin: EdgeInsets.only(left: emptyWidth / 2, right: emptyWidth / 2),
        ),
      ),
    );
  }
}
