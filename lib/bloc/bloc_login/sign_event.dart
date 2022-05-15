import '../../model/usuario.dart';

abstract class SignEvent {}

class SignUpEvent extends SignEvent {
	Usuario usuario;
	SignUpEvent({required this.usuario});
}

class SignInEvent extends SignEvent {}