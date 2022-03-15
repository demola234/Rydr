import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydr/models/ride_model.dart';
import 'package:rydr/utils/images_path.dart';
import 'package:rydr/utils/margins.dart';
import 'package:rydr/views/Home/Components/home_extention.dart';
import 'package:rydr/utils/colors.dart';
import '../vehicle_detail.dart';

class RideCard extends StatefulWidget {
  final RideModel rideModel;
  final ValueChanged<RideModel> onSelected;

  const RideCard({
    required this.rideModel,
    required this.onSelected,
    Key? key,
  }) : super(key: key);

  @override
  _RideCardState createState() => _RideCardState();
}

class _RideCardState extends State<RideCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        print("long");
        vehicleDetails(context);
      },
      child: Container(
        color: widget.rideModel.isSelected
            ? ColorPath.Primarydark
            : ColorPath.SecondaryColor.withOpacity(0.3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Image(
                width: 110,
                height: 66,
                image: AssetImage(widget.rideModel.image),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      widget.rideModel.name,
                      style: GoogleFonts.montserrat(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w700,
                        color: widget.rideModel.isSelected
                            ? ColorPath.SecondaryColor
                            : ColorPath.Primarydark,
                      ),
                    ),
                    Icon(
                      Icons.info_outline,
                      color: widget.rideModel.isSelected
                          ? ColorPath.SecondaryColor
                          : ColorPath.Primarydark,
                      size: 8,
                    )
                  ],
                ),
                YMargin(5),
                Row(
                  children: [
                    SvgPicture.asset(
                      ImagesAsset.time,
                      color: widget.rideModel.isSelected
                          ? ColorPath.SecondaryColor
                          : ColorPath.Primarydark,
                      height: 8,
                      width: 8,
                    ),
                    XMargin(3),
                    Text(
                      "21 mins",
                      style: GoogleFonts.montserrat(
                        fontSize: 11.0,
                        fontWeight: FontWeight.w300,
                        color: widget.rideModel.isSelected
                            ? ColorPath.SecondaryColor
                            : ColorPath.Primarydark,
                      ),
                    ),
                    XMargin(3),
                    Row(
                      children: [
                        Icon(
                          Icons.person_outline,
                          color: widget.rideModel.isSelected
                              ? ColorPath.SecondaryColor
                              : ColorPath.Primarydark,
                          size: 10,
                        ),
                        Text(
                          "3 seats",
                          style: GoogleFonts.montserrat(
                            fontSize: 11.0,
                            fontWeight: FontWeight.w300,
                            color: widget.rideModel.isSelected
                                ? ColorPath.SecondaryColor
                                : ColorPath.Primarydark,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                YMargin(5),
                Row(
                  children: [
                    SvgPicture.asset(
                      ImagesAsset.up,
                      color: widget.rideModel.isSelected
                          ? ColorPath.SecondaryColor
                          : ColorPath.Primarydark,
                    ),
                    Text(
                      "View trip cost details",
                      style: GoogleFonts.montserrat(
                        fontSize: 11.0,
                        fontWeight: FontWeight.w300,
                        color: widget.rideModel.isSelected
                            ? ColorPath.SecondaryColor
                            : ColorPath.Primarydark,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 17.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "\N " + widget.rideModel.price,
                    style: GoogleFonts.montserrat(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: widget.rideModel.isSelected
                          ? ColorPath.SecondaryColor
                          : ColorPath.Primarydark,
                    ),
                  ),
                  YMargin(5.0),
                  Text(
                    widget.rideModel.time,
                    style: GoogleFonts.montserrat(
                      fontSize: 9.0,
                      fontWeight: FontWeight.w500,
                      color: widget.rideModel.isSelected
                          ? ColorPath.SecondaryColor
                          : ColorPath.Primarydark,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ).ripple(() {
        setState(() {
          widget.onSelected(widget.rideModel);
        });
      }),
    );
  }
}
