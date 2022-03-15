import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydr/utils/images_path.dart';
import 'package:rydr/utils/margins.dart';
import 'package:rydr/views/Authentication/login_screen.dart';
import 'package:rydr/views/Home/Components/home_extention.dart';
import 'package:rydr/views/Home/chat_with_driver.dart';
import 'package:rydr/views/Notifications/notifications.dart';
import 'package:rydr/views/Payment/Coupons/apply_coupons.dart';
import 'package:rydr/views/Payment/payment.dart';
import 'package:rydr/views/Settings/manage_password.dart';
import 'package:rydr/views/Support/support.dart';
import 'package:rydr/utils/colors.dart';
import 'package:rydr/views/TripHistory/trip_screen.dart';

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
                          color: ColorPath.Primarydark,
                        ),
                      ),
                      YMargin(15),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        child: Container(
                          height: 33,
                          width: 125,
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
                                  "Edit Profile",
                                  style: GoogleFonts.poppins(
                                    color: ColorPath.Primarywhite,
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ).ripple(() {}),
                      ),
                    ])),
                  ],
                ),
                YMargin(10),
                DrawerDots(
                  dashColor: ColorPath.Primaryfield,
                  dashHeight: 1.0,
                  dashWidth: 2.0,
                ),
                YMargin(10),
                Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Column(children: [
                    DrawerListTile(
                      title: 'Your Trip History',
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TripScreen(),
                            ));
                      },
                    ),
                    DrawerListTile(
                      title: 'Payment',
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
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Notifications(),
                            ));
                      },
                    ),
                    DrawerListTile(
                      title: 'Apply Coupon',
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ApplyCoupon(),
                            ));
                      },
                    ),
                    DrawerListTile(
                      title: 'Support',
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Support(),
                            ));
                      },
                    ),
                    DrawerListTile(
                      title: 'Manage Password',
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ManagePassword(),
                            ));
                      },
                    ),
                    DrawerListTile(
                      title: 'About us',
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatWithDriver(),
                            ));
                      },
                    ),
                  ]),
                ),
                Spacer(),
                DrawerDots(
                  dashColor: ColorPath.Primaryfield,
                  dashHeight: 1.0,
                  dashWidth: 2.0,
                ),
                YMargin(10),
                Text("Share on:",
                    style: GoogleFonts.montserrat(
                      fontSize: 10.0,
                      fontWeight: FontWeight.w400,
                      color: ColorPath.Primarydark,
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
                      color: ColorPath.Primaryred,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Log out",
                          style: GoogleFonts.poppins(
                            color: ColorPath.Primarywhite,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ).ripple(() {
                  Navigator.of(context).pop();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ));
                }),
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
            color: ColorPath.Primarydark,
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
