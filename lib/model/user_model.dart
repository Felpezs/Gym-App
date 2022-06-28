class UserModel{
  String? _username;
  String? _genero;
  double? _altura;
  double? _peso;

  UserModel();

  UserModel.withData({username = "", genero = "", altura = 0, peso = 0}){
    _username = username;
    _genero = genero;
    _altura = altura;
    _peso = peso;
  }

  UserModel.fromMap(map){
    _username = map["username"];
    _genero = map['genero'];
    _altura = map['altura'];
    _peso = map['peso'];
  }

  String? get username{
    return _username;
  }

  String? get genero{
    return _genero;
  }

  double? get altura{
    return _altura;
  }

  double? get peso{
    return _peso;
  }

  set username(username){
    _username = username;
  }

  set genero(genero){
    _genero = genero;
  }

  set altura(altura){
    _altura = altura;
  }

  set peso(peso){
    _peso = peso;
  }
}