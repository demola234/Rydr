import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydr/utils/images_path.dart';
import 'package:rydr/utils/margins.dart';
import 'package:rydr/views/Home/build_trip_details.dart';
import 'package:rydr/utils/colors.dart';
import 'package:rydr/views/Payment/payment.dart';

class Support extends StatelessWidget {
  const Support({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPath.Primarywhite,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75.0),
        child: CustomAppBar(title: "Support"),
      ),
      body: Column(
        children: [
          const YMargin(40),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
                color: ColorPath.Primarywhite,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const YMargin(10),
                  Text(
                    "Rydr Support",
                    style: GoogleFonts.montserrat(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: ColorPath.Primarydark),
                  ),
                  const YMargin(15),
                  Text(
                    "Question and answer about Raize",
                    style: GoogleFonts.montserrat(
                      fontSize: 13,
                      fontWeight: FontWeight.w300,
                      color: ColorPath.PrimaryColor,
                    ),
                  ),
                  const YMargin(10),
                  FadeInUp(
                    duration: Duration(milliseconds: 1800),
                    child: DotWidget(
                      dashColor: ColorPath.Primaryfield,
                      dashHeight: 1.0,
                      dashWidth: 2.0,
                    ),
                  ),
                  const YMargin(15),
                  Card(
                      color: ColorPath.Primaryfield.withOpacity(0.5),
                      elevation: 0,
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                      shape: RoundedRectangleBorder(
                          side: new BorderSide(
                              color: ColorPath.PrimaryColor.withOpacity(0.6)),
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Column(children: [
                        ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 25),
                          onTap: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => FAQs()));
                          },
                          leading: SvgPicture.asset(ImagesAsset.faq),
                          title: Text(
                            "FAQ",
                            style: GoogleFonts.montserrat(
                                fontSize: 13, color: ColorPath.Primarydark),
                          ),
                          subtitle: Text(
                            "Question and answer about Banc",
                            style: TextStyle(
                                fontSize: 10, color: ColorPath.PrimaryColor),
                          ),
                          trailing:
                              Icon(Icons.arrow_forward_ios_outlined, size: 10),
                        ),
                        _buildDivider(),
                        ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 25),
                          onTap: () {
                            //  Navigator.push(context, MaterialPageRoute(builder: (context) => TechSupport()));
                          },
                          leading: SvgPicture.asset(ImagesAsset.headphone),
                          title: Text(
                            "Technical Support",
                            style: GoogleFonts.montserrat(
                                fontSize: 13, color: ColorPath.Primarydark),
                          ),
                          subtitle: Text(
                            "Tell us how we can help you",
                            style: GoogleFonts.montserrat(
                                fontSize: 10, color: ColorPath.PrimaryColor),
                          ),
                          trailing:
                              Icon(Icons.arrow_forward_ios_outlined, size: 10),
                        ),
                        _buildDivider(),
                        ListTile(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 25),
                          onTap: () {},
                          leading: SvgPicture.asset(ImagesAsset.chat),
                          title: Text(
                            "Chat live",
                            style: TextStyle(
                                fontSize: 13, color: ColorPath.Primarydark),
                          ),
                          subtitle: Text(
                            "Communicate with our customer service live",
                            style: GoogleFonts.montserrat(
                                fontSize: 10, color: ColorPath.PrimaryColor),
                          ),
                          trailing:
                              Icon(Icons.arrow_forward_ios_outlined, size: 10),
                        ),
                      ])),
                ]),
          ),
        ],
      ),
    );
  }
}

Widget _buildDivider() {
  return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      width: double.infinity - 10,
      height: 1,
      color: ColorPath.PrimaryColor.withOpacity(0.6));
}
