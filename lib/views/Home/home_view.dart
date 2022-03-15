import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rydr/models/favorite_item_model.dart';
import 'package:rydr/utils/images_path.dart';
import 'package:rydr/utils/margins.dart';
import 'package:rydr/views/Authentication/mobile_auth.dart';
import 'package:rydr/utils/colors.dart';
import 'package:rydr/views/Home/build_trip_details.dart';
import 'package:rydr/views/Home/Components/home_extention.dart';
import 'package:rydr/views/Home/schedule_trip.dart';
import 'Components/rydr_drawer.dart';
import 'Components/sheet_header.dart';

class Homeview extends StatefulWidget {
  const Homeview({Key? key}) : super(key: key);

  @override
  _HomeviewState createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  TextEditingController placetexteditingcontroller = TextEditingController();
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(8.479879, 4.641814),
      tilt: 50,
      zoom: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      backgroundColor: ColorPath.Primarywhite,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: AppBar(
            brightness: Brightness.dark,
            backgroundColor: ColorPath.Primarydark,
            automaticallyImplyLeading: false,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20.0, top: 5, bottom: 5),
                child: Container(
                  width: 45,
                  decoration: BoxDecoration(
                      color: ColorPath.PrimaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SvgPicture.asset(
                      ImagesAsset.drawer,
                      height: 24,
                      width: 24,
                    ),
                  ),
                ).ripple(() {
                  _key.currentState!.openDrawer();
                }),
              )
            ],
            centerTitle: false,
            title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello, Daniel 👋🏾",
                  style: GoogleFonts.poppins(
                    color: ColorPath.Primarywhite,
                    fontWeight: FontWeight.w400,
                    fontSize: 17,
                  ),
                ),
                Text(
                  "Catch a ride now!",
                  style: GoogleFonts.poppins(
                    color: ColorPath.PrimaryColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
            systemOverlayStyle: SystemUiOverlayStyle.light,
          )),
      drawer: RyderDrawer(),
      body: Stack(
        children: [
          FadeIn(
            duration: Duration(milliseconds: 1500),
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _kLake,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
          Positioned(
            bottom: 0,
            child: Column(
              children: [
                FadeInUp(
                  delay: Duration(milliseconds: 1000),
                  duration: Duration(milliseconds: 2000),
                  child: AnimatedContainer(
                      curve: Curves.easeInOut,
                      duration: Duration(milliseconds: 100),
                      alignment: Alignment.bottomCenter,
                      height: 300,
                      width: context.screenWidth(),
                      decoration: BoxDecoration(
                          color: ColorPath.Primarywhite,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25.0),
                              topRight: Radius.circular(25.0))),
                      child: Column(
                        children: [
                          YMargin(7.0),
                          Container(
                              width: 80,
                              height: 2.875,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(80)),
                                color: ColorPath.PrimaryColor.withOpacity(0.5),
                              )),
                          YMargin(20),
                          SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              children: [
                                CustomPlaceHolder(),
                                YMargin(10),
                                Container(
                                  height: 130,
                                  width: context.screenWidth(),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30.0),
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: favs.length,
                                        physics:
                                            RangeMaintainingScrollPhysics(),
                                        itemBuilder: (BuildContext context, i) {
                                          return Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 4.0),
                                                child: FavoriteItems(
                                                  icon: favs[i].icon,
                                                  time: favs[i].time,
                                                  text: favs[i].text,
                                                ),
                                              ),
                                            ],
                                          );
                                        }),
                                  ),
                                ),
                                YMargin(10),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 30),
                                    child: Container(
                                      height: 40,
                                      width: context.screenWidth() - 100,
                                      decoration: BoxDecoration(
                                        color: ColorPath.Secondarygrey,
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: InkWell(
                                        onTap: () {
                                          selectFavorite(context);
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Set favorite locations",
                                              style: GoogleFonts.poppins(
                                                color: ColorPath.Primarywhite,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  selectFavorite(BuildContext context) {
    TextEditingController favoritetextEditingController =
        TextEditingController();
    TextEditingController favoriteaddresstextEditingController =
        TextEditingController();
    setState(() {
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
              height: context.screenHeight() / 2.1,
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
                    FadeInUp(
                      duration: Duration(milliseconds: 1000),
                      child: Column(
                        children: [
                          YMargin(15),
                          Text(
                            "Set favorite location",
                            style: GoogleFonts.montserrat(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500,
                              color: ColorPath.Primarydark,
                            ),
                          ),
                          Text(
                            "Pick a favorite location to enable quick access",
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
                          CustomTextFieldWidget(
                            controller: favoritetextEditingController,
                            keyboardType: TextInputType.streetAddress,
                            autofill: [AutofillHints.addressCityAndState],
                            hintText: 'Enter favorite location',
                          ),
                          YMargin(10),
                          CustomTextFieldWidget(
                            controller: favoriteaddresstextEditingController,
                            keyboardType: TextInputType.streetAddress,
                            autofill: [AutofillHints.addressCityAndState],
                            hintText: 'Enter favorite address',
                          ),
                          YMargin(10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30.0),
                                child: Text(
                                  "Pick a favorite location to enable quick access",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 11.0,
                                    fontWeight: FontWeight.w300,
                                    color: ColorPath.offBlack,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          YMargin(10),
                          Container(
                            height: 100,
                            width: context.screenWidth() / 1.2,
                            child: GridView(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 3 / 4,
                                mainAxisSpacing: 30,
                                mainAxisExtent: 50,
                                crossAxisSpacing: 10,
                              ),
                              padding: EdgeInsets.only(left: 20),
                              scrollDirection: Axis.horizontal,
                              children: AppData.favsitems
                                  .map((favoriteLists) => FavoriteCard(
                                      favoriteLists: favoriteLists,
                                      onSelected: (model) {
                                        setState(() {
                                          AppData.favsitems.forEach((item) {
                                            item.isSelected = false;
                                          });
                                          model.isSelected = true;
                                        });
                                      }))
                                  .toList(),
                            ),
                          ),
                          YMargin(7),
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
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Set  favorite locations",
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
              ),
            );
          });
    });
  }
}

class FavoriteItems extends StatelessWidget {
  final String icon;
  final String text;
  final String time;

  FavoriteItems({
    required this.icon,
    required this.text,
    required this.time,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        height: 120,
        width: 110,
        decoration: BoxDecoration(
            border: Border.all(color: ColorPath.PrimaryColor),
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            )),
        child: Column(
          children: [
            YMargin(10),
            Container(
              height: 67,
              width: 67,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFF5F6F5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: SvgPicture.asset(icon, height: 26, width: 26),
              ),
            ),
            YMargin(5.0),
            Text(
              text,
              style: GoogleFonts.montserrat(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: ColorPath.Primarydark,
              ),
            ),
            YMargin(5.0),
            Text(
              time,
              style: GoogleFonts.montserrat(
                fontSize: 9,
                fontWeight: FontWeight.w400,
                color: Color(0xFF999393),
              ),
            ),
          ],
        ),
      ).ripple(() {}),
    );
  }
}

class CustomPlaceTextWidget extends StatelessWidget {
  final ValueChanged<String>? onSubmitted;
  final Widget suffix;
  final Widget prefix;
  final String hintText;

  final TextEditingController placetexteditingcontroller =
      TextEditingController();
  CustomPlaceTextWidget(
      {this.onSubmitted,
      required this.suffix,
      required this.prefix,
      required this.hintText,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30),
      height: 55,
      width: context.screenWidth() - 60,
      child: TextField(
        scrollPadding: EdgeInsets.symmetric(vertical: 15),
        onSubmitted: onSubmitted,
        controller: placetexteditingcontroller,
        cursorColor: ColorPath.Primaryblack,
        keyboardType: TextInputType.streetAddress,
        autofillHints: [AutofillHints.addressCity],
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          prefixIcon: prefix,
          suffix: suffix,
          filled: true,
          fillColor: ColorPath.Primaryfield.withOpacity(0.3),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
            borderSide: BorderSide(
              color: ColorPath.Primaryfield,
            ),
          ),
          hintText: hintText,
          alignLabelWithHint: true,
          hintStyle: GoogleFonts.montserrat(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: ColorPath.Primarydark.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}

class PrefixIcon1 extends StatelessWidget {
  PrefixIcon1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SvgPicture.asset(ImagesAsset.car, height: 15, width: 15),
    );
  }
}

class PrefixIcon2 extends StatelessWidget {
  const PrefixIcon2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SvgPicture.asset(
        ImagesAsset.locate,
        color: ColorPath.Primarydark.withOpacity(0.5),
        height: 10,
        width: 10,
      ),
    );
  }
}

class SuffixNow1 extends StatelessWidget {
  const SuffixNow1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {},
      child: Container(
          height: 25,
          width: 60,
          decoration: BoxDecoration(
              color: ColorPath.Primarydark,
              borderRadius: BorderRadius.all(Radius.circular(5.0))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.timer_outlined,
                size: 13.0,
                color: ColorPath.Primarywhite,
              ),
              Text(
                "Now",
                style: GoogleFonts.montserrat(
                  fontSize: 10.0,
                  fontWeight: FontWeight.w500,
                  color: ColorPath.Primarywhite,
                ),
              )
            ],
          )).ripple(() {
        scheduleTrip(context);
      }),
    );
  }
}

class SuffixNow2 extends StatelessWidget {
  const SuffixNow2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () async {
          scheduleTrip(context);
        },
        child: Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
                color: ColorPath.Primarydark,
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            child: Icon(
              Icons.add,
              size: 12.0,
              color: ColorPath.Primarywhite,
            )));
  }
}

class CustomPlaceHolder extends StatelessWidget {
  const CustomPlaceHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        height: 55,
        width: context.screenWidth(),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          color: ColorPath.Primaryfield.withOpacity(0.3),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              SvgPicture.asset(ImagesAsset.car, height: 25, width: 25),
              XMargin(10),
              Text(
                "Where to ?",
                style: GoogleFonts.montserrat(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: ColorPath.Primarydark,
                ),
              ),
            ]),
            InkWell(
              onTap: () {},
              child: Container(
                  height: 25,
                  width: 60,
                  decoration: BoxDecoration(
                      color: ColorPath.Primarydark,
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.timer_outlined,
                        size: 13.0,
                        color: ColorPath.Primarywhite,
                      ),
                      Text(
                        "Now",
                        style: GoogleFonts.montserrat(
                          fontSize: 10.0,
                          fontWeight: FontWeight.w500,
                          color: ColorPath.Primarywhite,
                        ),
                      )
                    ],
                  )).ripple(() {}),
            ),
          ],
        ),
      ).ripple(() {
        showModalBottomSheet(
            isDismissible: true,
            isScrollControlled: true,
            elevation: 0,
            backgroundColor: Colors.transparent,
            clipBehavior: Clip.hardEdge,
            context: context,
            builder: (context) {
              return Container(
                padding: EdgeInsets.only(top: 7),
                height: context.screenHeight() - 118,
                width: context.screenWidth(),
                decoration: BoxDecoration(
                  color: ColorPath.Primarywhite,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: pickLocation(context),
              );
            });
      }),
    );
  }

  Widget pickLocation(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            sheetHeader(),
            YMargin(40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  SvgPicture.asset(ImagesAsset.side),
                  Column(
                    children: [
                      CustomPlaceTextWidget(
                        hintText: "Current location",
                        onSubmitted: (_) {
                          buildTripDetails(context);
                        },
                        suffix: SuffixNow1(),
                        prefix: PrefixIcon1(),
                      ),
                      YMargin(5.0),
                      CustomPlaceTextWidget(
                        hintText: "Your current location",
                        onSubmitted: (_) {
                          buildTripDetails(context);
                        },
                        suffix: SuffixNow2(),
                        prefix: PrefixIcon2(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Column(
          children: [
            SvgPicture.asset(ImagesAsset.stopwatch),
            YMargin(10),
            Text(
              "Consider the driver and don’t keep the driver waiting.",
              style: GoogleFonts.montserrat(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: ColorPath.Primarydark,
              ),
            ),
            YMargin(10),
            Text(
              "You will be charged an additional N150 for every minute you \nkeep the driver waiting",
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                fontSize: 8.0,
                fontWeight: FontWeight.w400,
                color: Color(0xFF999393),
              ),
            ),
            YMargin(15),
            Container(
              height: 70,
              width: context.screenWidth(),
              decoration: BoxDecoration(
                color: ColorPath.Primarydark,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(ImagesAsset.globe),
                    XMargin(5.0),
                    Text(
                      "Search on Map",
                      style: GoogleFonts.montserrat(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: ColorPath.Primarywhite,
                      ),
                    )
                  ]),
            ),
          ],
        )
      ],
    );
  }
}

class FavoriteCard extends StatefulWidget {
  final FavoriteLists favoriteLists;
  final ValueChanged<FavoriteLists> onSelected;
  FavoriteCard({
    Key? key,
    required this.favoriteLists,
    required this.onSelected,
  }) : super(key: key);

  @override
  _FavoriteCardState createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          color: widget.favoriteLists.isSelected
              ? Colors.black
              : ColorPath.Primarywhite,
          border: Border.all(
              color: widget.favoriteLists.isSelected
                  ? Colors.transparent
                  : Colors.grey),
          borderRadius: BorderRadius.circular(3.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          widget.favoriteLists.isSelected
              ? Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Container(
                      child: Icon(
                        Icons.check_circle,
                        size: 10,
                        color: Colors.green,
                      ),
                    )
                  ]),
                )
              : SizedBox.shrink(),
          YMargin(5.0),
          SvgPicture.asset(
            widget.favoriteLists.icon,
            color: widget.favoriteLists.isSelected
                ? ColorPath.Primaryfield
                : ColorPath.Primarydark,
          )
        ],
      ),
    ).ripple(() {
      setState(() {
        widget.onSelected(widget.favoriteLists);
      });
    }));
  }
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
