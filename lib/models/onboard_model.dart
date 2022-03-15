import 'package:flutter/material.dart';
import 'package:rydr/utils/colors.dart';
import 'package:rydr/utils/images_path.dart';

class OnboardModel {
  String img;
  String text;
  String desc;
  Color bg;
  Color button;

  OnboardModel({
    required this.img,
    required this.text,
    required this.desc,
    required this.bg,
    required this.button,
  });
}

List<OnboardModel> screens = <OnboardModel>[
  OnboardModel(
    img: ImagesAsset.parking,
    text: "Enjoy smooth ride",
    desc:
        "We have varieties of cars available for you\n with luxury features to ensure you have a \nperfect ride.",
    bg: ColorPath.Primarywhite,
    button: Color(0xFF4756DF),
  ),
  OnboardModel(
    img: ImagesAsset.money,
    text: "Enjoy smooth ride",
    desc:
        "We have varieties of cars available for you\n with luxury features to ensure you have a \nperfect ride.",
    bg: Color(0xFF4756DF),
    button: ColorPath.Primarywhite,
  ),
  OnboardModel(
    img: ImagesAsset.accomodation,
    text: "Enjoy smooth ride",
    desc:
        "We have varieties of cars available for you\n with luxury features to ensure you have a \nperfect ride.",
    bg: ColorPath.Primarywhite,
    button: Color(0xFF4756DF),
  ),
];
