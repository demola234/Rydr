import 'dart:math';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rydr/utils/images_path.dart';
import 'package:rydr/utils/margins.dart';
import 'package:rydr/views/Home/Components/home_extention.dart';
import 'package:rydr/utils/colors.dart';
import 'drivers_details.dart';

class ChatWithDriver extends StatefulWidget {
  const ChatWithDriver({Key? key}) : super(key: key);

  @override
  _ChatWithDriverState createState() => _ChatWithDriverState();
}

class _ChatWithDriverState extends State<ChatWithDriver> {
  String? text;
  TextEditingController? _textEditingController;
  final List<Message> messages = [
    Message(1, "I’m at your location, Please were are you?"),
    Message(1, "Yes, please. I am on my way"),
    Message(0, "Please were are you at the moment"),
  ];

  _savemsg() async {
    if (_textEditingController!.text.isEmpty) return;
    FocusScope.of(context).requestFocus(FocusNode());
    setState(() {
      messages.insert(0, Message(0, _textEditingController!.text));
      _textEditingController!.clear();
    });
  }

  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  final rand = Random();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75.0),
        child: ChatAppBar(),
      ),
      body: FadeInUp(
        duration: Duration(milliseconds: 2000),
        child: Column(children: [
          YMargin(10),
          Expanded(
              child: ListView.builder(
                  itemCount: messages.length,
                  reverse: true,
                  // physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    Message msg = messages[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: msg.user == 1
                            ? MainAxisAlignment.start
                            : MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              crossAxisAlignment: msg.user == 1
                                  ? CrossAxisAlignment.start
                                  : CrossAxisAlignment.end,
                              children: [
                                Text(
                                  msg.user == 1 ? "Driver" : "You",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.w500,
                                      color: ColorPath.Primarydark),
                                ),
                                YMargin(5),
                                Container(
                                  height: 40,
                                  padding: EdgeInsets.symmetric(
                                    vertical: 10.0,
                                    horizontal: 16.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: msg.user == 1
                                        ? ColorPath.SecondaryColor
                                        : ColorPath.PrimaryColor,
                                    borderRadius: BorderRadius.circular(9.0),
                                  ),
                                  child: Text(
                                    msg.desc,
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w300,
                                      color: msg.user == 1
                                          ? ColorPath.Primarydark
                                          : ColorPath.Primarywhite,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  })),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 16.0,
            ),
            margin: EdgeInsets.symmetric(
              vertical: 8,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.0),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    textInputAction: TextInputAction.send,
                    controller: _textEditingController,
                    style: GoogleFonts.montserrat(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                        color: ColorPath.Primarydark),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 10.0,
                      ),
                      hintText: "Send Message to Driver",
                      hintStyle: GoogleFonts.montserrat(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF999393),
                      ),
                      suffixIcon: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(Icons.tag_faces_outlined),
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100.0),
                          borderSide: BorderSide(
                            width: 0.5,
                            color: Color(0xFFDADADA),
                          )),
                    ),
                    onEditingComplete: _savemsg,
                  ),
                ),
                XMargin(5.0),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorPath.Primarydark,
                  ),
                  child: IconButton(
                    onPressed: () {
                      _savemsg();
                    },
                    icon: Icon(
                      Icons.send,
                      color: ColorPath.Primarywhite,
                    ),
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}

class ChatAppBar extends StatelessWidget {
  const ChatAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorPath.Primarydark,
      automaticallyImplyLeading: false,
      centerTitle: true,
      leadingWidth: 67,
      title: Column(
        children: [
          Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImagesAsset.driverpic),
                ),
                borderRadius: BorderRadius.circular(8.0)),
          ).ripple(() {
            driversDetail(context);
          }),
          YMargin(5),
          Text(
            "James Daniel",
            style: GoogleFonts.montserrat(
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
              color: ColorPath.SecondaryColor,
            ),
          ),
        ],
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
                color: ColorPath.Primaryfield,
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            child: Center(
                child: Icon(
              Icons.arrow_back_ios,
              size: 18,
              color: ColorPath.Primarydark,
            )),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 20),
          child: Center(
            child: Container(
              height: 30,
              width: 30,
              child: SvgPicture.asset(
                ImagesAsset.call,
                height: 26,
                width: 23,
              ),
            ).ripple(() {}),
          ),
        )
      ],
      systemOverlayStyle: SystemUiOverlayStyle.light,
    );
  }
}

class Message {
  final int user;
  final String desc;

  Message(this.user, this.desc);
}
