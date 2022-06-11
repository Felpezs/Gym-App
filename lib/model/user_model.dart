class UserModel{
  String? _username;
  String? _genero;
  double? _altura;
  double? _peso;

  UserModel();

  UserModel.withData({username = "", genero = "", altura = 0, peso = 0});

  UserModel.fromMap(map){
    _username = map["username"];
    _genero = map['genero'];
    _altura = map['altura'];
    _peso = map['peso'];
  }

  String? get username{
    return _username;
  }

  double? get altura{
    return _altura;
  }

  double? get peso{
    return _peso;
  }
}