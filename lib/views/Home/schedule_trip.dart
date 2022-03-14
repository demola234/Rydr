import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydr/utils/margins.dart';
import 'package:rydr/views/Home/Components/home_extention.dart';
import 'Components/sheet_header.dart';
import 'build_trip_details.dart';

scheduleTrip(BuildContext context) {
  showModalBottomSheet(
      isDismissible: true,
      isScrollControlled: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      clipBehavior: Clip.hardEdge,
      context: context,
      builder: (context) {
        return ScheduleTrip();
      });
}

class ScheduleTrip extends StatefulWidget {
  const ScheduleTrip({Key? key}) : super(key: key);

  @override
  _ScheduleTripState createState() => _ScheduleTripState();
}

class _ScheduleTripState extends State<ScheduleTrip> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 7),
        height: context.screenHeight() / 3,
        width: context.screenWidth(),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: Container(
            child: Column(children: [
          sheetHeader(),
          YMargin(15),
          Text(
            "Schedule a Trip",
            style: GoogleFonts.montserrat(
              fontSize: 20.0,
              fontWeight: FontWeight.w500,
              color: Color(0xFF1F2421),
            ),
          ),
          Text(
            "Book a ride for later?",
            style: GoogleFonts.montserrat(
              fontSize: 11.0,
              fontWeight: FontWeight.w300,
              color: Color(0xFF50555C),
            ),
          ),
          YMargin(10),
          DotWidget(
            dashColor: Color(0xFFDCE1DE),
            dashHeight: 1.0,
            dashWidth: 2.0,
          ),
          YMargin(20),
          Container(
            child: Column(
              children: [
                Text(
                  "Date",
                  style: GoogleFonts.montserrat(
                    fontSize: 11.0,
                    fontWeight: FontWeight.w300,
                    color: Color(0xFF50555C),
                  ),
                ),
                YMargin(10),
                Text(
                  "Mon, 10 June, 2021",
                  style: GoogleFonts.montserrat(
                    fontSize: 13.0,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF878E88),
                  ),
                ),
                YMargin(10),
                DotWidget(
                  dashColor: Color(0xFFDCE1DE),
                  dashHeight: 1.0,
                  dashWidth: 2.0,
                ),
              ],
            ),
          ).ripple(() async {
            final initialDate = DateTime.now();
            await showDatePicker(
              context: context,
              builder: (context, child) {
                return Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: ColorScheme.light(
                      primary: Color(0xFF1F2421),
                      onPrimary: Colors.white,
                      onSurface: Color(0xFF1F2421),
                    ),
                    textButtonTheme: TextButtonThemeData(
                      style: TextButton.styleFrom(
                        primary: Color(0xFF878E88),
                      ),
                    ),
                  ),
                  child: child!,
                );
              },
              initialDate: initialDate,
              firstDate: DateTime(DateTime.now().year - 80),
              lastDate: DateTime(DateTime.now().year + 1),
            );
          }),
          YMargin(15),
          Container(
            child: Column(
              children: [
                Text(
                  "Time",
                  style: GoogleFonts.montserrat(
                    fontSize: 11.0,
                    fontWeight: FontWeight.w300,
                    color: Color(0xFF50555C),
                  ),
                ),
                YMargin(10),
                Text(
                  "09 : 00 pm",
                  style: GoogleFonts.montserrat(
                    fontSize: 13.0,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF878E88),
                  ),
                ),
                YMargin(10),
                DotWidget(
                  dashColor: Color(0xFFDCE1DE),
                  dashHeight: 1.0,
                  dashWidth: 2.0,
                ),
              ],
            ),
          ).ripple(() async {
            final initialDate = DateTime.now();
            await showTimePicker(
              initialTime: TimeOfDay.now(),
              context: context,
              builder: (context, child) {
                return Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: ColorScheme.light(
                      primary: Color(0xFF1F2421),
                      onPrimary: Colors.white,
                      onSurface: Color(0xFF1F2421),
                    ),
                    textButtonTheme: TextButtonThemeData(
                      style: TextButton.styleFrom(
                        primary: Color(0xFF878E88),
                      ),
                    ),
                  ),
                  child: child!,
                );
              },
            );
          }),
        ])));
  }
}
