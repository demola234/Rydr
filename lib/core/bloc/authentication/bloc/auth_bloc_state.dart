part of 'auth_bloc_bloc.dart';

abstract class AuthBlocState extends Equatable {
  const AuthBlocState();

  @override
  List<Object> get props => [];
}

///[AuthBlocInitial] State before the Authentication progress starts
class AuthBlocInitial extends AuthBlocState {}

///[AuthBlocLaoding] State when the user is awaiting verification the be completed
class AuthBlocLaoding extends AuthBlocState {}

///[AuthBlocLogin] State when the user have the been loaded into the application
class AuthBlocLogin extends AuthBlocState {
  final String? uid;
  final String? firstname;
  final String? lastname;
  final String? email;
  const AuthBlocLogin(this.uid, this.firstname, this.lastname, this.email);
}

///[AutoLoggedState] State that automatically logs a user in the application
class AutoLoggedState extends AuthBlocLogin {
  final String? uid;
  final String? firstname;
  final String? lastname;
  final String? email;
  const AutoLoggedState(this.uid, this.firstname, this.lastname, this.email) : super(uid, firstname, lastname, email);
}

///[StateErrorSignUp] State when a user Error Occurs
class StateErrorSignUp extends AuthBlocState {
  final String message;
  const StateErrorSignUp(this.message);
}

///[CodeSentState] State when the user is sent a verification Code
class CodeSentState extends AuthBlocState {
  final String verificationId;
  final int token;
  const CodeSentState(this.verificationId, this.token);
}
