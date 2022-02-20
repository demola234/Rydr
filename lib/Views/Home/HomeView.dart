import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Homeview extends StatefulWidget {
  const Homeview({Key? key}) : super(key: key);

  @override
  _HomeviewState createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(floatingActionButton: FloatingActionButton(
      onPressed: () async {
        FirebaseFirestore.instance.collection("Users").add({"id": "UserId"});
      },
    ));
  }
}
