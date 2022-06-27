import 'package:prog_mobile/model/user_model.dart';

abstract class UserInfoState {}

class InfoError extends UserInfoState {
  String message = "";
  InfoError({required this.message});
}
class Loading extends UserInfoState{}
class PersonalInfo extends UserInfoState{
  UserModel userModel;
  PersonalInfo({required this.userModel});
}