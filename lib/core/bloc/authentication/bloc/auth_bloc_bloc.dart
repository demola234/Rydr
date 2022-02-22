import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rydr/core/repository/user_repository.dart';
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
        final user = await UserRepo.instance.getUser(uid);
        yield AuthBlocLogin(
            user?.uid, user?.firstname, user?.lastname, user?.email);
      } else if (event is CodeEventToken) {
        yield CodeSentState(event.verificationId, event.token!);
      } else if (event is SignUpEvent) {
        yield* _setUpAccount(event);
      } else if (event is LoginCurrentUser) {
        yield UserRepo.instance.signInUser();
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

  Stream<AuthBlocState> _setUpAccount(SignUpEvent event) async* {
    yield AuthBlocLaoding();
    final user = await UserRepo.instance
        .setUpAccount(event.uid!, event.firstname, event.lastname, event.email);
    yield AuthBlocLogin(
        user?.uid, user?.firstname, user?.lastname, user?.email);
  }
}
