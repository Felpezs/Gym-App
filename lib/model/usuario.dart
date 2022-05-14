class Usuario{
  String _username = "";
  String _password = "";

  Usuario({required username, required password}){
    _username = username;
    _password = password;
  }

  Map<String, dynamic> toMap(){
    var map = Map<String, dynamic>();
    map["username"] = _username;
    map["password"] = _password;
    return map;
  }
}