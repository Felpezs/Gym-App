abstract class UserInfoState {}

class PersonalInfoState extends UserInfoState{

}

class UserInfoError extends UserInfoState {
  String message = "";
  UserInfoError({required this.message});
}