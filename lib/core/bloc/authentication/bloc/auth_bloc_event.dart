part of 'auth_bloc_bloc.dart';

abstract class AuthBlocEvent extends Equatable {
  const AuthBlocEvent();

  @override
  List<Object> get props => [];
}

/// [SignUpEvent] creates the signUp Event of the User takes the [uid], [firstname], [lastname], [email] and [phone]
/// This is the Create details of the User
class SignUpEvent extends AuthBlocEvent {
  final String? uid;
  final String firstname;
  final String lastname;
  final String email;
  const SignUpEvent(this.uid, this.firstname, this.lastname, this.email);
}

/// [PhoneNumberVerificationEvent] Checks the Users Phone Number and Verify the Phone Numebr
/// Takes the User Phone Number a verify Before [smsCode] is Sent
class PhoneNumberVerificationEvent extends AuthBlocEvent {
  final String phone;
  const PhoneNumberVerificationEvent(this.phone);
}

/// [PhoneAuthCodeVerificationEvent] Sents the User [smsCode] and Verifies the Code
class PhoneAuthCodeVerificationEvent extends AuthBlocEvent {
  final String phone;
  final String smsCode;
  final String verificationId;
  const PhoneAuthCodeVerificationEvent(
      this.phone, this.smsCode, this.verificationId);
}

/// [CompleteAuthEvent] Starts a phone number verification process for the given phone number.
/// This method is used to verify that the user-provided phone number belongs to the user.
/// Firebase sends a code via SMS message to the phone number, where you must then prompt the user to enter the code.
/// The code can be combined with the verification ID to create a [PhoneAuthProvider.credential]
class CompleteAuthEvent extends AuthBlocEvent {
  final AuthCredential credential;
  const CompleteAuthEvent(this.credential);
}

/// [ErrorOccuredEvent] an Error Occured in the verification process
class ErrorOccuredEvent extends AuthBlocEvent {
  final String error;
  const ErrorOccuredEvent(this.error);
}

/// [CodeEventToken] triggers an error occurred during phone number verification.
/// A [FirebaseAuthException] is provided when this is triggered.
class CodeEventToken extends AuthBlocEvent {
  final int? token;
  final String verificationId;
  const CodeEventToken(this.token, this.verificationId);
}

class LoginCurrentUser extends AuthBlocEvent {}
