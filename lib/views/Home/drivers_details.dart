import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydr/utils/images_path.dart';
import 'package:rydr/utils/margins.dart';
import 'build_trip_details.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rydr/utils/colors.dart';

driversDetail(BuildContext context) {
  showModalBottomSheet(
      isDismissible: false,
      isScrollControlled: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      clipBehavior: Clip.hardEdge,
      context: context,
      builder: (context) {
        return DriversDetail();
      });
}

class DriversDetail extends StatefulWidget {
  const DriversDetail({
    Key? key,
  }) : super(key: key);

  @override
  _DriversDetailState createState() => _DriversDetailState();
}

class _DriversDetailState extends State<DriversDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 7),
      height: context.screenHeight() / 1.2,
      width: context.screenWidth(),
      decoration: BoxDecoration(
        color: ColorPath.Primarywhite,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.only(right: 20),
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      color: ColorPath.Primarywhite, shape: BoxShape.circle),
                  child: Icon(Icons.cancel_outlined),
                ),
              ),
            ],
          ),
          Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Container(
                    child: Image(
                      width: 110,
                      height: 110,
                      image: AssetImage(ImagesAsset.driverpic),
                    ),
                  ),
                ),
                YMargin(14),
                Text(
                  "James Daniel",
                  style: GoogleFonts.montserrat(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                    color: ColorPath.Primarydark,
                  ),
                ),
                YMargin(15),
                DotWidget(
                  dashColor: ColorPath.Primaryfield,
                  dashHeight: 1.0,
                  dashWidth: 2.0,
                ),
                YMargin(15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Trip Details",
                        style: GoogleFonts.montserrat(
                          fontSize: 11.0,
                          fontWeight: FontWeight.w600,
                          color: ColorPath.offBlack,
                        ),
                      ),
                      YMargin(15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Total Completed Trips",
                                style: GoogleFonts.montserrat(
                                  fontSize: 9.0,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF818181),
                                ),
                              ),
                              YMargin(5),
                              Text(
                                "214",
                                style: GoogleFonts.montserrat(
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w600,
                                  color: ColorPath.Primarydark,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Total Trip Orders",
                                style: GoogleFonts.montserrat(
                                  fontSize: 9.0,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF818181),
                                ),
                              ),
                              YMargin(5),
                              Text(
                                "278",
                                style: GoogleFonts.montserrat(
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w600,
                                  color: ColorPath.Primarydark,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "AVERAGE DRIVER RATING",
                                style: GoogleFonts.montserrat(
                                  fontSize: 9.0,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF818181),
                                ),
                              ),
                              YMargin(5),
                              Row(
                                children: [
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
                                    ],
                                  ),
                                  Text(
                                    "4.7",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.w600,
                                      color: ColorPath.Primarydark,
                                    ),
                                  ),
                                ],
                              ),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Vehicle Details",
                            style: GoogleFonts.montserrat(
                              fontSize: 11.0,
                              fontWeight: FontWeight.w600,
                              color: ColorPath.offBlack,
                            ),
                          ),
                          YMargin(9),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Car Model",
                                style: GoogleFonts.montserrat(
                                  fontSize: 9.0,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF818181),
                                ),
                              ),
                              YMargin(3),
                              Text(
                                "Toyata Camery 2010",
                                style: GoogleFonts.montserrat(
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w600,
                                  color: ColorPath.Primarydark,
                                ),
                              ),
                            ],
                          ),
                          YMargin(8),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Vehicle Number",
                                style: GoogleFonts.montserrat(
                                  fontSize: 9.0,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF818181),
                                ),
                              ),
                              YMargin(3),
                              Text(
                                "237183AR",
                                style: GoogleFonts.montserrat(
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w600,
                                  color: ColorPath.Primarydark,
                                ),
                              ),
                            ],
                          ),
                          YMargin(8),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Vehicle Color",
                                style: GoogleFonts.montserrat(
                                  fontSize: 9.0,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF818181),
                                ),
                              ),
                              YMargin(3),
                              Text(
                                "Black Color",
                                style: GoogleFonts.montserrat(
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w600,
                                  color: ColorPath.Primarydark,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "Contact Driver",
                            style: GoogleFonts.montserrat(
                              fontSize: 11.0,
                              fontWeight: FontWeight.w600,
                              color: ColorPath.offBlack,
                            ),
                          ),
                          YMargin(9),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(15.0),
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                    color: ColorPath.Primarydark,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(11),
                                    )),
                                child: SvgPicture.asset(ImagesAsset.message),
                              ),
                              XMargin(5.0),
                              Container(
                                padding: const EdgeInsets.all(15.0),
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                    color: ColorPath.Primarydark,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(11),
                                    )),
                                child: SvgPicture.asset(ImagesAsset.call,
                                    height: 12, width: 12),
                              ),
                            ],
                          ),
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
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Vehicle Images",
                        style: GoogleFonts.montserrat(
                          fontSize: 11.0,
                          fontWeight: FontWeight.w600,
                          color: ColorPath.offBlack,
                        ),
                      ),
                    ],
                  ),
                ),
                YMargin(14),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Container(
                    child: Image(
                      width: 338,
                      height: 182,
                      image: AssetImage(ImagesAsset.vehicle1),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
