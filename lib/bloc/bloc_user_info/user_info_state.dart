abstract class UserInfoState {}

class Inserted extends UserInfoState{}
class NotInserted extends UserInfoState{}
class InfoError extends UserInfoState {
  String message = "";
  InfoError({required this.message});
}