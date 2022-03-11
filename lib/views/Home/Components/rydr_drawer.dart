import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydr/utils/images_path.dart';
import 'package:rydr/utils/margins.dart';
import 'package:rydr/views/Payment/payment.dart';


class RyderDrawer extends StatelessWidget {
  const RyderDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.5,
      margin: const EdgeInsets.only(right: 30),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        child: Drawer(
          child: Padding(
            padding: EdgeInsets.only(top: 70),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        child: Column(children: [
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
                          color: Color(0xFF1F2421),
                        ),
                      ),
                      YMargin(15),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        child: Container(
                          height: 33,
                          width: 125,
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
                                  "Edit Profile",
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ])),
                  ],
                ),
                YMargin(10),
                DrawerDots(
                  dashColor: Color(0xFFDCE1DE),
                  dashHeight: 1.0,
                  dashWidth: 2.0,
                ),
                YMargin(10),
                Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Column(children: [
                    DrawerListTile(
                      title: 'Your Trip History',
                      onPressed: () {},
                    ),
                    DrawerListTile(
                      title: 'Payment ',
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Payments(),
                            ));
                      },
                    ),
                    DrawerListTile(
                      title: 'Notifications',
                      onPressed: () {},
                    ),
                    DrawerListTile(
                      title: 'Earnings',
                      onPressed: () {},
                    ),
                    DrawerListTile(
                      title: 'Support',
                      onPressed: () {},
                    ),
                    DrawerListTile(
                      title: 'About',
                      onPressed: () {},
                    ),
                    DrawerListTile(
                      title: 'Settings',
                      onPressed: () {},
                    ),
                  ]),
                ),
                Spacer(),
                DrawerDots(
                  dashColor: Color(0xFFDCE1DE),
                  dashHeight: 1.0,
                  dashWidth: 2.0,
                ),
                YMargin(10),
                Text("Share on:",
                    style: GoogleFonts.montserrat(
                      fontSize: 10.0,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF1F2421),
                    )),
                YMargin(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                YMargin(10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Container(
                    height: 40,
                    width: 137,
                    decoration: BoxDecoration(
                      color: Color(0xFFFF2E2E),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Log out",
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
                YMargin(10),
                Spacer()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final String title;
  final void Function() onPressed;

  const DrawerListTile({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      title: Text(title,
          style: GoogleFonts.montserrat(
            fontSize: 12.0,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1F2421),
          )),
    );
  }
}

class DrawerDots extends StatelessWidget {
  final double totalWidth, dashWidth, emptyWidth, dashHeight;

  final Color dashColor;

  const DrawerDots({
    this.totalWidth = 150,
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
