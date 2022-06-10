import 'package:prog_mobile/model/user_model.dart';

abstract class UserInfoState {}

class Inserted extends UserInfoState{}
class NotInserted extends UserInfoState{}
class InfoError extends UserInfoState {
  String message = "";
  InfoError({required this.message});
}
class PersonalInfo extends UserInfoState{
  UserModel userModel;

  PersonalInfo({required this.userModel});
}