class User {
  String? uid;
  String? firstname;
  String? lastname;
  String? email;
  DateTime? createdAt;
  bool? isVerified;

  User.fromJson(String uid, Map<String, dynamic> json) {
    this.uid = uid;
    if (json.containsKey("firstname")) {
      firstname = json["firstname"];
    }
    if (json.containsKey("lastname")) {
      lastname = json["lastname"];
    }
    if (json.containsKey("email")) {
      email = json["email"];
    }
    if (json.containsKey("createdAt")) {
      createdAt = DateTime.fromMillisecondsSinceEpoch(
          json["createdAt"].millisecondsSinceEpoch);
    }
    if (json.containsKey("isVerified")) {
      firstname = json["isVerified"];
    }
  }
}
