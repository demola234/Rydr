import 'package:flutter/material.dart';
import 'package:rydr/utils/colors.dart';

Widget sheetHeader() {
  return Container(
      width: 80,
      height: 2.875,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(80)),
        color: ColorPath.PrimaryColor.withOpacity(0.5),
      ));
}
