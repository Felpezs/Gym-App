import 'package:prog_mobile/model/user_model.dart';

abstract class AuthState {}

class Authenticated extends AuthState {
  UserModel userModel;

  Authenticated({required this.userModel});
}

class Unauthenticated extends AuthState {}
class AuthError extends AuthState {
  String message = "";
  AuthError({required this.message});
}