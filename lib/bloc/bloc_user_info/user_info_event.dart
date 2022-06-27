import 'package:prog_mobile/model/user_model.dart';

abstract class UserInfoEvent {}

class InsertInfo extends UserInfoEvent{
  final String username;
  final String genero;
  final double altura;
  final double peso;

  InsertInfo({required this.username, required this.genero, required this.altura, required this.peso});
}
class UpdateInfo extends UserInfoEvent{
  final UserModel userModel;

  UpdateInfo({required this.userModel});
}
class GetInfo extends UserInfoEvent{}
