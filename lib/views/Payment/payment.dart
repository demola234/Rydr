import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydr/utils/images_path.dart';
import 'package:rydr/utils/margins.dart';

class Payments extends StatelessWidget {
  const Payments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75.0),
        child: CustomAppBar(title: "Payment"),
      ),
      body: Column(
        children: [
          YMargin(20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 340,
                  height: 122,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFF1F2421),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(ImagesAsset.paybg),
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Rydr Balance",
                        style: GoogleFonts.montserrat(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFF3F3C1),
                        ),
                      ),
                      YMargin(10),
                      Text(
                        "N13,300",
                        style: GoogleFonts.montserrat(
                          fontSize: 36.0,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFF3F3C1),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          YMargin(30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Text(
                  "Payment Methods",
                  style: GoogleFonts.montserrat(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF1F2421),
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

class CustomAppBar extends StatelessWidget {
  final String title;
  CustomAppBar({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Color(0xFF1F2421),
        automaticallyImplyLeading: false,
        brightness: Brightness.dark,
        centerTitle: true,
        leadingWidth: 67,
        title: Text(
          title,
          style: GoogleFonts.montserrat(
            fontSize: 18.0,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: 15),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                  color: Color(0xFFDCE1DE),
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: Center(
                  child: Icon(
                Icons.arrow_back_ios,
                size: 18,
                color: Color(0xFF1F2421),
              )),
            ),
          ),
        ));
  }
}
