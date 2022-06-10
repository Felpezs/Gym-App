class UserModel{
  String? _username;
  String? _sexo;
  double? _altura;
  double? _peso;

  UserModel();

  UserModel.withData({username = "", sexo = "", altura = 0, peso = 0});

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