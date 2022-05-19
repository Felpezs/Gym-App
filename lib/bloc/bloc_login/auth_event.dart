import 'dart:html';

import '../../model/user_model.dart';

abstract class AuthEvent {}

class SignUpEvent extends AuthEvent {
	String username;
  String email;
  String password;
	SignUpEvent({required this.username, required this.email, required this.password});
}

class SignInEvent extends AuthEvent {
  String email;
  String password;

  SignInEvent({required this.email, required this.password});
}

class AuthServerEvent extends AuthEvent {
  final UserModel? userModel;
  AuthServerEvent(this.userModel);
}