import 'package:flutter/material.dart';

class Homeview extends StatefulWidget {
  const Homeview({ Key? key }) : super(key: key);

  @override
  _HomeviewState createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Hello")
      ],
    );
  }
}