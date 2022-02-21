import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rydr/core/services/authentication.dart';
part 'auth_bloc_event.dart';
part 'auth_bloc_state.dart';

class AuthBlocBloc extends Bloc<AuthBlocEvent, AuthBlocState> {
  AuthenticationService _authenticationService = AuthenticationService.instance;

  AuthBlocBloc() : super(AuthBlocInitial()) {
    on<AuthBlocEvent>((event, emit) async* {
      if (event is PhoneNumberVerificationEvent) {
        yield* _phoneAuthVerificationtoState(event);
      } else if (event is PhoneAuthCodeVerificationEvent) {
        final uid = await _authenticationService.verifyAndLogin(
            event.phone, event.smsCode, event.verificationId);
        yield AuthBlocLogin(uid);
      } else if (event is CodeEventToken) {
        yield CodeSentState(event.verificationId, event.token);
      }
    });
  }

  Stream<AuthBlocState> _phoneAuthVerificationtoState(
      PhoneNumberVerificationEvent event) async* {
    yield AuthBlocLaoding();
    await _authenticationService.verifyPhoneSendOtp(event.phone,
        completed: (credential) {
      print("complete");
      add(CompleteAuthEvent(credential));
    }, failure: (error) {
      print("error");
      add(ErrorOccuredEvent(error.toString()));
    }, codeSent: (String id, int? token) {
      print("codesent");
      add(CodeEventToken(token!, id));
    }, codeAuthRetrivalTimeout: (id) {
      print("RetriveCodeAuth");
      add(CodeEventToken(0, id));
    });
  }
}
