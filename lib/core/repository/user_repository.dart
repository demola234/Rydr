import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:rydr/models/user_model.dart';

class UserRepo {
  UserRepo._();

  static UserRepo? _instance;

  static UserRepo get instance {
    if (_instance == null) {
      _instance = UserRepo._();
    }
    return _instance!;
  }

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  /// [ValueNotifier] that holds a single value.
  /// When [value] is replaced with something that is not equal to the old value as
  /// evaluated by the equality operatorid ==, this class notifies its listeners.
  /// 
  ValueNotifier<User?> userNotifier = ValueNotifier<User?>(null);

  User? get currentUser {
    return userNotifier.value;
  }

  /// [setUpAccount]
  Future<User?> setUpAccount(
      String uid, String firstname, String lastname, String email) async {
    await firebaseFirestore.collection("users").doc(uid).update({
      "email": email,
      "firstname": firstname,
      "lastname": lastname,
      "role": 0,
      "isVerified": true
    });
    userNotifier.value = await UserRepo.instance.getUser(uid);
    return null;
  }

  Future<User?> getUser(String? uid) async {
    userNotifier.value = null;
    DocumentSnapshot usersnapshot =
        await firebaseFirestore.collection("users").doc(uid).get();
    if (!usersnapshot.exists) {
      return null;
    } else {
      Map<String, dynamic> data = usersnapshot.data() as Map<String, dynamic>;
      userNotifier.value = User.fromJson(uid!, data);
    }
    return userNotifier.value;
  }

  Future<void> signInUser() async {
    if (UserRepo.instance.currentUser == null) {
      auth.User? authUser = auth.FirebaseAuth.instance.currentUser;
      if (authUser == null) {
        print("No user exists");
      } else {
        await UserRepo.instance.getUser(authUser.uid);
      }
    }
  }
}
