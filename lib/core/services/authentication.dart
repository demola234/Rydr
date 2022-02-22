import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  /// [AuthenticationService] Creating a singleton for the class above
  /// This ensures that a class has only one instance and also provides a global point of access to it
  /// This helps to reduce redudant code and replace it with a single line of code.

  AuthenticationService._();

  static AuthenticationService? _instance;

  static AuthenticationService get instance {
    if (_instance == null) {
      _instance = AuthenticationService._();
    }
    return _instance!;
  }

  FirebaseAuth? _auth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<void> verifyPhoneSendOtp(
    ///Starts a phone number verification process for the given phone number.
    /// [verifyPhoneSendOtp] Firebase sends a code via SMS message to the phone number,
    ///where you must then prompt the user to enter the code.
    /// The code can be combined with the verification ID to
    /// create a [PhoneAuthProvider.credential] which you can then use to sign the user in, or link with their account

    String phone, {
    void Function(PhoneAuthCredential)? completed,
    void Function(FirebaseAuthException)? failure,
    void Function(String, int?)? codeSent,
    void Function(String)? codeAuthRetrivalTimeout,
  }) async {
    _auth!.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: completed!,
      verificationFailed: failure!,
      codeSent: codeSent!,
      codeAutoRetrievalTimeout: codeAuthRetrivalTimeout!,
    );
  }

  /// [verifyAndLogin] creates a new Phone credential with an verification ID and SMS code
  ///Make sure user Receives Otp
  ///Add User to the Firestore if User is a new User else Return an empty String if the User already Exists!
  Future<String> verifyAndLogin(
      String verificationId, String smsCode, String phone) async {
    /// The PhoneAuthProvider.credential takes two credentials verification and smsCode
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: smsCode);

    ///If successful it signs the user in into the app and
    ///updates any [authStateChanges], [idTokenChanges] or [userChanges] stream listeners.
    final authCredential = await _auth!.signInWithCredential(credential);
    if (authCredential.user != null) {
      /// If the user is not null or exists,
      /// Get/Fetch the Users details from FirebaseFirestore Data Collection
      /// Return the users UID
      final uid = authCredential.user!.uid;
      final userSnapshot =
          await firebaseFirestore.collection("user").doc(uid).get();

      /// [userSnapshot] If the user is does not exist or is null,
      /// Create the new user in the FirebaseFireStore taking the Users uid and phoneNumber
      if (!userSnapshot.exists) {
        await firebaseFirestore
            .collection("user")
            .doc(uid)
            .set({"uid": uid, "phone": phone});
      }
      return uid;
    } else {
      return '';
    }
  }

  /// [getCredentials] If successful, it also signs the user in into the app and updates
  /// any [authStateChanges], [idTokenChanges] or [userChanges] stream listeners.
  ///If the user doesn't have an account already, one will be created automatically.
  Future<String> getCredentials(PhoneAuthCredential credential) async {
    final authCredentail = await _auth!.signInWithCredential(credential);
    return authCredentail.user!.uid;
  }
}
