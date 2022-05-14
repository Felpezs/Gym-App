import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/usuario.dart';

abstract class ManageEvent {}

class SignUpEvent extends ManageEvent {
	Usuario usuario;
	SignUpEvent({required this.usuario});
}