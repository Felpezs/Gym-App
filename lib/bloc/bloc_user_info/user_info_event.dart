abstract class UserInfoEvent {}

class AddPersonalInfoEvent extends UserInfoEvent{

}

class FirstEntry extends UserInfoEvent{
  final String uid;
  FirstEntry({required this.uid});
}
