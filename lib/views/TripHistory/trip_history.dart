import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rydr/utils/images_path.dart';
import 'package:rydr/views/Home/build_trip_details.dart';
import 'package:rydr/utils/colors.dart';
import 'package:rydr/views/Payment/payment.dart';
import 'package:rydr/utils/margins.dart';
import 'package:rydr/views/Home/Components/home_extention.dart';

class TripHistory extends StatelessWidget {
  const TripHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CameraPosition _kLake = CameraPosition(
      target: LatLng(8.479879, 4.541814),
      zoom: 30,
    );

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75.0),
        child: CustomAppBar(title: "Your Trip History"),
      ),
      body: Column(
        children: [
          YMargin(40),
          FadeInUp(
            duration: Duration(milliseconds: 1400),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Container(
                clipBehavior: Clip.antiAlias,
                height: 130,
                width: context.screenWidth(),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                child: GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: _kLake,
                ),
              ),
            ),
          ),
          YMargin(20),
          FadeInUp(
            duration: Duration(milliseconds: 1600),
            child: Padding(
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
          ),
          YMargin(20),
          FadeInUp(
            duration: Duration(milliseconds: 1600),
            child: DotWidget(
              dashColor: ColorPath.Primaryfield,
              dashHeight: 1.0,
              dashWidth: 2.0,
            ),
          ),
          YMargin(20),
          FadeInUp(
            duration: Duration(milliseconds: 1800),
            child: Padding(
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
                    onTap: () {},
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
          ),
          YMargin(14),
          FadeInUp(
            duration: Duration(milliseconds: 1800),
            child: DotWidget(
              dashColor: ColorPath.Primaryfield,
              dashHeight: 1.0,
              dashWidth: 2.0,
            ),
          ),
          YMargin(14),
          FadeInUp(
            duration: Duration(milliseconds: 1800),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Trip Cost",
                    style: GoogleFonts.montserrat(
                      fontSize: 9.0,
                      fontWeight: FontWeight.w300,
                      color: ColorPath.offBlack,
                    ),
                  ),
                  YMargin(10),
                  Row(
                    children: [
                      Text(
                        "N 1,100",
                        style: GoogleFonts.montserrat(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w700,
                          color: ColorPath.Primarydark,
                        ),
                      ),
                      XMargin(8.0),
                      Container(
                        width: 47,
                        height: 18,
                        decoration: BoxDecoration(
                            color: ColorPath.Primaryfield.withOpacity(0.47),
                            borderRadius: BorderRadius.circular(2),
                            border: Border.all(
                                color: ColorPath.PrimaryColor
                                  ..withOpacity(0.5))),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(ImagesAsset.cash),
                            XMargin(3.0),
                            Text(
                              "Cash",
                              style: GoogleFonts.montserrat(
                                fontSize: 9.0,
                                fontWeight: FontWeight.w300,
                                color: ColorPath.offBlack,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          YMargin(14),
          FadeInUp(
            duration: Duration(milliseconds: 2000),
            child: DotWidget(
              dashColor: ColorPath.Primaryfield,
              dashHeight: 1.0,
              dashWidth: 2.0,
            ),
          ),
          YMargin(14),
          FadeInUp(
            duration: Duration(milliseconds: 2000),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Make Complaint",
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
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(ImagesAsset.rider))),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Report Driver",
                            style: GoogleFonts.montserrat(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w700,
                              color: ColorPath.Primarydark,
                            ),
                          ),
                          YMargin(8.0),
                          Text(
                            "Did your Driver Act in an inappropiate way? File a complit now!",
                            style: GoogleFonts.montserrat(
                              fontSize: 8.0,
                              fontWeight: FontWeight.w300,
                              color: ColorPath.Primarydark,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          YMargin(14),
          FadeInUp(
            duration: Duration(milliseconds: 2200),
            child: DotWidget(
              dashColor: ColorPath.Primaryfield,
              dashHeight: 1.0,
              dashWidth: 2.0,
            ),
          ),
          Spacer(),
          FadeInUp(
            duration: Duration(milliseconds: 2300),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Container(
                height: 50,
                width: context.screenWidth(),
                decoration: BoxDecoration(
                  color: ColorPath.Secondarygrey,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Share Ryde Information",
                        style: GoogleFonts.poppins(
                          color: ColorPath.SecondaryColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ).ripple(() {}),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
