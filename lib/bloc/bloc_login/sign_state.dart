import 'package:flutter_bloc/flutter_bloc.dart';

abstract class SignState {}

class SignUpValidState extends SignState {}
class SignUpInvalidState extends SignState {}
class SignInState extends SignState {}