class UserModel{
  String? _username;
  int? _sexo;
  int? _altura;
  int? _peso;

  UserModel();

  UserModel.withData({username = "", sexo = "", altura = "", peso = ""});

  UserModel.fromMap(map){
    _username = map['username'];
    _sexo = map['sexo'];
    _altura = map['altura'];
    _peso = map['peso'];
  }

  String? get username{
    return _username;
  }
}