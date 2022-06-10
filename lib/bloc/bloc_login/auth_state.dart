import 'package:prog_mobile/model/user_model.dart';

abstract class AuthState {}

class Authenticated extends AuthState {}

class Unauthenticated extends AuthState {}
class AuthError extends AuthState {
  String message = "";
  AuthError({required this.message});
}