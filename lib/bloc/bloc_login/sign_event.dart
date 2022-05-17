import '../../model/usuario.dart';

abstract class SignEvent {}

class SignUpEvent extends SignEvent {
	String username;
  String email;
  String password;
	SignUpEvent({required this.username, required this.email, required this.password});
}

class SignInEvent extends SignEvent {}