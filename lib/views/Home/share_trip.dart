import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydr/utils/images_path.dart';
import 'package:rydr/utils/margins.dart';
import 'build_trip_details.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rydr/utils/colors.dart';

final CameraPosition _kLake = CameraPosition(
  target: LatLng(8.479879, 4.541814),
  zoom: 24,
);

shareTripInfo(BuildContext context) {
  Navigator.pop(context);
  showModalBottomSheet(
      isDismissible: false,
      isScrollControlled: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      clipBehavior: Clip.hardEdge,
      context: context,
      builder: (context) {
        return ShareTripInfo();
      });
}

class ShareTripInfo extends StatefulWidget {
  const ShareTripInfo({
    Key? key,
  }) : super(key: key);

  @override
  _ShareTripInfoState createState() => _ShareTripInfoState();
}

class _ShareTripInfoState extends State<ShareTripInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 7),
      height: context.screenHeight() / 1.7,
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
                // sheetHeader(),
                YMargin(15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Share trip info",
                        style: GoogleFonts.montserrat(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                          color: ColorPath.Primarydark,
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
                YMargin(14),
                Padding(
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
                        "Trip Route",
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
                YMargin(10.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Container(
                    height: 40,
                    width: context.screenWidth(),
                    decoration: BoxDecoration(
                      color: ColorPath.Primarydark,
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
        ],
      ),
    );
  }
}
