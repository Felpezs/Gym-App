import '../../model/user_model.dart';

abstract class AuthEvent {}

class SignUpEvent extends AuthEvent {
  String email;
  String password;
	SignUpEvent({required this.email, required this.password});
}

class SignInEvent extends AuthEvent {
  String email;
  String password;

  SignInEvent({required this.email, required this.password});
}

class SignOutEvent extends AuthEvent {}

class AuthServerEvent extends AuthEvent {
  final String? uid;
  AuthServerEvent(this.uid);
}