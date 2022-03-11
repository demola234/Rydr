import 'package:flutter/material.dart';
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
      img: ImagesAsset.PARKING,
      text: "Enjoy smooth ride",
      desc:
          "We have varieties of cars available for you\n with luxury features to ensure you have a \nperfect ride.",
      bg: Colors.white,
      button: Color(0xFF4756DF),
    ),
    OnboardModel(
      img: ImagesAsset.MONEY,
      text: "Enjoy smooth ride",
      desc:
          "We have varieties of cars available for you\n with luxury features to ensure you have a \nperfect ride.",
      bg: Color(0xFF4756DF),
      button: Colors.white,
    ),
    OnboardModel(
      img: ImagesAsset.ACCOMODATION,
      text: "Enjoy smooth ride",
      desc:
          "We have varieties of cars available for you\n with luxury features to ensure you have a \nperfect ride.",
      bg: Colors.white,
      button: Color(0xFF4756DF),
    ),
  ];
