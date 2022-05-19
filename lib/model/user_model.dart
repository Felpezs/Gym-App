class UserModel{
  String? _uid;
  String? _username = "";
  String? _password = "";
  String? _email = "";

  UserModel({required uid, username, email, password}){
    _uid = uid;
    _username = username;
    _email = email;
    _password = password;
  }

  get uid{
    return _uid;
  }
}