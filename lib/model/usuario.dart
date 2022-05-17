class Usuario{
  String _username = "";
  String _password = "";
  String _email = "";

  Usuario({required username, required email,required password}){
    _username = username;
    _email = email;
    _password = password;
  }

  Map<String, dynamic> toMap(){
    var map = Map<String, dynamic>();
    map["username"] = _username;
    map["password"] = _password;
    return map;
  }
}