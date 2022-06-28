class Exercicio{
  String? _nomeExercicio;
  String? _categoria;

  Exercicio();

  Exercicio.withData({nomeExercicio = "", categoria = ""}){
    _nomeExercicio = nomeExercicio;
    _categoria = categoria;
  }

  Exercicio.fromMap(map) {
    _nomeExercicio = map["nomeExercicio"];
    _categoria = map["categoria"];
  }

  get nomeExercicio{
    return _nomeExercicio;
  }

  get categoria{
    return _categoria;
  }

}