import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydr/utils/images_path.dart';
import 'package:rydr/utils/margins.dart';
import 'Components/sheet_header.dart';
import 'package:rydr/utils/colors.dart';

vehicleDetails(BuildContext context) {
  showModalBottomSheet(
      isDismissible: true,
      isScrollControlled: false,
      elevation: 0,
      backgroundColor: Colors.transparent,
      clipBehavior: Clip.hardEdge,
      context: context,
      builder: (context) {
        return VehiclesDetails();
      });
}

class VehiclesDetails extends StatefulWidget {
  const VehiclesDetails({
    Key? key,
  }) : super(key: key);

  @override
  _VehiclesDetailsState createState() => _VehiclesDetailsState();
}

class _VehiclesDetailsState extends State<VehiclesDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 7),
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
            YMargin(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Container(
                child: Image(
                  width: 110,
                  height: 66,
                  image: AssetImage(ImagesAsset.regular),
                ),
              ),
            ),
            YMargin(14),
            Text(
              "Rydr Regular",
              style: GoogleFonts.montserrat(
                fontSize: 15.0,
                fontWeight: FontWeight.w700,
                color: ColorPath.Primarydark,
              ),
            ),
            YMargin(20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 34),
              child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      color: ColorPath.Primarydark,
                      borderRadius: BorderRadius.circular(7.0)),
                  child: Center(
                    child: Text(
                      "Classic, everyday rides to the mall, your office, the restaurant for dinner \nwith friends, or to your Primary Place of Assignment!",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                          fontSize: 8.0,
                          fontWeight: FontWeight.w400,
                          color: ColorPath.SecondaryColor),
                    ),
                  )),
            ),
            YMargin(14),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Fare",
                        style: GoogleFonts.montserrat(
                          fontSize: 11.0,
                          fontWeight: FontWeight.w500,
                          color: ColorPath.Primarydark,
                        ),
                      ),
                      Text(
                        "N12,000",
                        style: GoogleFonts.montserrat(
                          fontSize: 11.0,
                          fontWeight: FontWeight.w500,
                          color: ColorPath.Primarydark,
                        ),
                      ),
                    ],
                  ),
                  YMargin(14),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Wait Time",
                        style: GoogleFonts.montserrat(
                          fontSize: 11.0,
                          fontWeight: FontWeight.w500,
                          color: ColorPath.Primarydark,
                        ),
                      ),
                      Text(
                        "N10/Min",
                        style: GoogleFonts.montserrat(
                          fontSize: 11.0,
                          fontWeight: FontWeight.w500,
                          color: ColorPath.Primarydark,
                        ),
                      ),
                    ],
                  ),
                  YMargin(14),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Seat",
                        style: GoogleFonts.montserrat(
                          fontSize: 11.0,
                          fontWeight: FontWeight.w500,
                          color: ColorPath.Primarydark,
                        ),
                      ),
                      Text(
                        "4",
                        style: GoogleFonts.montserrat(
                          fontSize: 11.0,
                          fontWeight: FontWeight.w500,
                          color: ColorPath.Primarydark,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            YMargin(40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                "The price estimation can change if actual tools/surcharges differ from estimation. If the journey changes, the price will be based on rates provided.",
                textAlign: TextAlign.start,
                style: GoogleFonts.montserrat(
                    fontSize: 10.0,
                    fontWeight: FontWeight.w400,
                    color: ColorPath.Primarydark),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
