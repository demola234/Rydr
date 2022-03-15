import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydr/models/onboard_model.dart';
import 'package:rydr/utils/images_path.dart';
import 'package:rydr/utils/margins.dart';
import 'package:rydr/views/Authentication/choose_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rydr/utils/colors.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int currentIndex = 0;

  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  _storeOnboardInfo() async {
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('onBoarding', isViewed);
    print(prefs.getInt('onBoarding'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorPath.Primarywhite,
        body: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              children: [
                YMargin(80),
                Container(
                  width: context.screenWidth(),
                  height: 45,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.contain,
                          image: AssetImage(ImagesAsset.logo))),
                ),
                SizedBox(height: 30),
                Expanded(
                  child: Stack(children: [
                    Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(ImagesAsset.citybg))),
                    ),
                    YMargin(10),
                    PageView.builder(
                        itemCount: screens.length,
                        controller: _pageController,
                        physics: BouncingScrollPhysics(),
                        onPageChanged: (int index) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                        itemBuilder: (_, index) {
                          return Column(
                            children: [
                              YMargin(220),
                              Column(
                                children: [
                                  Container(
                                    width: 320,
                                    height: 160,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.contain,
                                            image: AssetImage(
                                                screens[index].img))),
                                  ),
                                  YMargin(5),
                                  Text(
                                    screens[index].text,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                      color: ColorPath.SecondaryColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17.3,
                                    ),
                                  ),
                                  YMargin(10),
                                  Text(
                                    screens[index].desc,
                                    textAlign: TextAlign.center,
                                    maxLines: 5,
                                    overflow: TextOverflow.clip,
                                    style: GoogleFonts.poppins(
                                      color: ColorPath.Primarywhite,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 13.6,
                                    ),
                                  ),
                                  YMargin(20),
                                ],
                              ),
                            ],
                          );
                        }),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 100.0),
                        child: Container(
                          height: 10.0,
                          child: ListView.builder(
                            itemCount: screens.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 3.0),
                                      width: 45,
                                      height: 1.5,
                                      decoration: BoxDecoration(
                                        color: currentIndex == index
                                            ? ColorPath.Primarydark
                                            : Color(0xFFEBEBEB),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  ]);
                            },
                          ),
                        ),
                      ),
                    ),
                    YMargin(30),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            currentIndex != 2
                                ? Container(
                                    child: InkWell(
                                      onTap: () {
                                        _storeOnboardInfo();
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ChooseAuth()));
                                      },
                                      child: Container(
                                        height: 52,
                                        width: 93,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(14.0),
                                            color: ColorPath.Primarydark),
                                        child: Center(
                                          child: Text(
                                            "Skip",
                                            style: GoogleFonts.poppins(
                                                color: ColorPath.Primarywhite),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : SizedBox(
                                    height: 52,
                                    width: 93,
                                  ),
                            XMargin(50),
                            Container(
                              child: InkWell(
                                onTap: () async {
                                  if (currentIndex == screens.length - 1) {
                                    await _storeOnboardInfo();
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ChooseAuth()));
                                  }
                                  _pageController.nextPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                },
                                child: Container(
                                  height: 61,
                                  width: 61,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: ColorPath.Primarydark),
                                  child: Center(
                                      child: SvgPicture.asset(
                                          ImagesAsset.rightarrow)),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ]),
                ),
              ],
            )));
  }
}
